import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lms_adv/core/network/api_url.dart';
import 'package:lms_adv/core/storage/token_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
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
  }
  Dio get dio => _dio;
}

class AuthTokenInterceptor extends Interceptor {
  final TokenStorageService _tokenStorageService;

  AuthTokenInterceptor({required this._tokenStorageService});
  @override
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _tokenStorageService.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = "Bearer $accessToken";
    }
    super.onRequest(options, handler);
  }
}
