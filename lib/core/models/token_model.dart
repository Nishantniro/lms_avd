class TokenModel {
  final String accessToken;
  final String refreshToken;

  TokenModel({required this.accessToken, required this.refreshToken});

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      accessToken: map['accessToken'] ?? map['access_token'],
      refreshToken: map['refreshToken'] ?? map['refresh_token'],
    );
  }
}
