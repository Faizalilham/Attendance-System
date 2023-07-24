class RegisterResponse {
  String message;

  RegisterResponse({required this.message});

  factory RegisterResponse.fromMap(Map<String, dynamic> json) {
    return RegisterResponse(message: json["message"]);
  }
}
