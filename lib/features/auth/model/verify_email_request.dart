
class  VerifyEmailRequestModel {
  final String email;
  final String otp;

  VerifyEmailRequestModel({required this.email, required this.otp});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'otp': otp,
    };
  }

  
}
