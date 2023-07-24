import 'dart:convert';

class RegisterRequest {
  String username;
  String email;
  String password;
  String re_password;

  RegisterRequest(
      {required this.username, required this.email, required this.password,required this.re_password});

  Map<String, dynamic> toMap() {
    return {"username": username, "email": email, "password": password,"re_password": re_password};
  }

  String toJson() => json.encode(toMap());
}
