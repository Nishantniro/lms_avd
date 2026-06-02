import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lms_adv/core/error/falilure.dart';

class ErrorHandler {
 static Failure handleException(dynamic e) {
    if (e is DioException) {
      if (e.error is SocketException) {
        return InternetFailure();
      }
      return SomethingWentWrongFailure();
    } else {
      return SomethingWentWrongFailure();
    }
  }
}
