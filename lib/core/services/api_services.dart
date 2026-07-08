import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lms_adv/core/error/error_handler.dart';
import 'package:lms_adv/core/typedef/either.dart';

class ApiServices {
  final Dio _dio;

  ApiServices({required this._dio});

  FutureEither<T> get<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancleToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancleToken,
      );
      return Right(
        fromJson != null ? fromJson(response.data) : response.data as T,
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  FutureEither<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancleToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        queryParameters: queryParameters,
        data: data,

        options: options,
        cancelToken: cancleToken,
      );
      return Right(
        fromJson != null ? fromJson(response.data) : response.data as T,
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  FutureEither<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? canclToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: canclToken,
      );
      return Right(
        fromJson != null ? fromJson(response.data) : response.data as T,
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  FutureEither<T> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? canclToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final Response response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: canclToken,
      );
      return Right(
        fromJson != null ? fromJson(response.data) : response.data as T,
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
