import 'dart:convert';

class ChangePasswordRequest {
  String email;

  ChangePasswordRequest({required this.email});

  Map<String, dynamic> toMap() {
    return {"email": email};
  }

  String toJson() => json.encode(toMap());
}

class ChangePasswordResponse {
  String message;

  ChangePasswordResponse({required this.message});

  factory ChangePasswordResponse.fromMap(Map<String, dynamic> json) {
    return ChangePasswordResponse(message: json["message"]);
  }
}
