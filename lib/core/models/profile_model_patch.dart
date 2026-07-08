// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';

class ProfileModelPatch {
  final String? username;
  final String? name;
  final File? avatar;
  ProfileModelPatch({this.username, this.name, this.avatar});
  Future<FormData> toFormDataMap() async {
    final fileName = avatar?.path.split("/").last;
    return FormData.fromMap({
      'name': name,
      'avatar': fileName == null
          ? null
          : await MultipartFile.fromFile(avatar!.path, filename: fileName),
    });
  }
}
