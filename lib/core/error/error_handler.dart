import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lms_adv/core/error/falilure.dart';

class ErrorHandler {
  static Failure handleException(dynamic e) {
    if (e is SocketException) {
      return const InternetFailure();
    }

    if (e is DioException) {
      return _handleDioException(e);
    }

    return const SomethingWentWrongFailure();
  }

  static Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure(message: 'time out');

      case DioExceptionType.connectionError:
        return const InternetFailure();

      case DioExceptionType.badResponse:
        return _handleStatusCode(e.response?.statusCode, e.response?.data);

      default:
        return const SomethingWentWrongFailure();
    }
  }

  static Failure _handleStatusCode(int? statusCode, dynamic data) {
    // final message = data?["detail"] ?? data?["message"] ?? data.toString();
    String message;
    if (data is Map<String, dynamic>) {
      message =
          data["detail"]?.toString() ??
          data["message"]?.toString() ??
          data.toString();
    } else {
      message = data?.toString() ?? "Something went wrong";
    }

    switch (statusCode) {
      case 400:
        return BadRequestFailure(message);

      case 401:
        return const UnauthorizedFailure();

      case 403:
        return const ForbiddenFailure();

      case 404:
        return const NotFoundFailure();

      case 405:
        return const MethodNotAllowedFailure();

      case 409:
        return const ConflictFailure();

      case 422:
        return ValidationFailure(message);

      case 500:
        return ServerFailure("Internal server error", message: 'try again');

      default:
        return SomethingWentWrongFailure();
    }
  }
}
