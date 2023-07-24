class LoginResponse {
  String message;
  String? token;

  LoginResponse({required this.message, required this.token});

  factory LoginResponse.fromMap(Map<String, dynamic> json) {
    return LoginResponse(message: json["message"], token: json["token"]);
  }
}
