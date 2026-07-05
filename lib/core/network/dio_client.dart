import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lms_adv/core/models/token_model.dart';
import 'package:lms_adv/core/network/api_url.dart';
import 'package:lms_adv/core/storage/token_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late Dio _dio;
  final AuthTokenInterceptor _authTokenInterceptor;

  DioClient({required this._authTokenInterceptor}) {
    _dio = Dio(BaseOptions(baseUrl: kBaseUrl));
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          if (options.path.contains('/posts')) {
            return false;
          }
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
    _dio.interceptors.add(_authTokenInterceptor);
    _authTokenInterceptor.attachDio(_dio);
  }
  Dio get dio => _dio;
}

class AuthTokenInterceptor extends Interceptor {
  final TokenStorageService _tokenStorageService;

  AuthTokenInterceptor({required this._tokenStorageService});
  late Dio _dio;

  final Dio _refreshDio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  Completer<void>? _completer;
  void attachDio(Dio dio) {
    _dio = dio;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _tokenStorageService.getAccessToken();
    final isPublicRoute =
        options.path.contains('/auth/login/') ||
        options.path.contains('/auth/sign-up/') ||
        options.path.contains('/auth/verify-email/') ||
        options.path.contains('/auth/token/refresh/');

    if (!isPublicRoute && accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = "Bearer $accessToken";
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.requestOptions.path.contains("/auth/token/refresh/")) {
      return handler.next(err);
    }

    if (err.response?.statusCode == 401) {
      if (_completer != null) {
        await _completer!.future;

        final accessToken = await _tokenStorageService.getAccessToken();

        err.requestOptions.headers["Authorization"] = "Bearer $accessToken";

        final response = await _dio.fetch(err.requestOptions);

        return handler.resolve(response);
      }
      if (_completer == null) {
        _completer = Completer<void>();
        final refreshToken = await _tokenStorageService.getRefreshToken();

        try {
          if (refreshToken == null || refreshToken.isEmpty) {
            throw Exception("Refresh token not found");
          }
          final response = await _refreshDio.post(
            "/auth/token/refresh/",
            data: {"refresh": refreshToken},
          );

          final tokenModel = TokenModel(
            accessToken: response.data["access"],
            refreshToken: response.data["refresh"],
          );
          await _tokenStorageService.saveTokens(tokenModel);
          _completer!.complete();
          _completer = null;
          final newAccessToken = await _tokenStorageService.getAccessToken();

          final requestOptions = err.requestOptions;
          requestOptions.headers["Authorization"] = "Bearer $newAccessToken";
          final output = await _dio.fetch(requestOptions);
          return handler.resolve(output);
        } on DioException catch (e) {
          _completer?.completeError(e);

          await _tokenStorageService.clear();
          return handler.next(err);
        } finally {
          _completer = null;
        }
      }
    }
    return handler.next(err);
  }
}
