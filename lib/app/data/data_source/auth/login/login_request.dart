import 'dart:convert';

class LoginRequest {
  String email;
  String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {"email": email, "password": password};
  }

  String toJson() => json.encode(toMap());
}
