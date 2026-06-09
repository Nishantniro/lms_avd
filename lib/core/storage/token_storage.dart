import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lms_adv/core/models/token_model.dart';

class TokenStorageService {
  final FlutterSecureStorage _storage;
  final String _accessTokenKey = "access_token";
  final String _refreshTokenKey = "refresh_token";

  TokenStorageService(this._storage);

  Future<void> saveTokens(TokenModel model) async {
    try {
      await _storage.write(key: _accessTokenKey, value: model.accessToken);

      _storage.write(key: _refreshTokenKey, value: model.refreshToken);
      log("saved access token: ${await _storage.read(key: _accessTokenKey)}");
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getAccessToken() async {
    try {
      return await _storage.read(key: _accessTokenKey);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: _refreshTokenKey);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
