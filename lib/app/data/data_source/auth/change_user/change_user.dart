import 'dart:convert';

import 'package:attendance_system/app/data/data_source/auth/current_user/current_user.dart';

class ChangeUser {
  String username;

  ChangeUser({required this.username});

  Map<String, dynamic> toMap() => {"username": username};

  String toJson() => json.encode(toMap());

}

class ChangeUserResponse {
  String message;
  User? data;
  ChangeUserResponse({required this.message,required this.data});

  factory ChangeUserResponse.fromMap(Map<String, dynamic> json) {
    return ChangeUserResponse(
      message: json["message"],
      data: User.fromMap(json["data"])
      );
  }
}
