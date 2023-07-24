import 'dart:convert';

import 'package:attendance_system/app/data/data_source/auth/change_password/change_password.dart';
import 'package:attendance_system/app/data/data_source/auth/change_user/change_user.dart';
import 'package:attendance_system/app/data/data_source/auth/current_user/current_user.dart';
import 'package:attendance_system/app/data/data_source/auth/login/login_request.dart';

import 'package:attendance_system/app/data/data_source/auth/login/login_response.dart';

import 'package:attendance_system/app/data/data_source/auth/register/register_request.dart';

import 'package:attendance_system/app/data/data_source/auth/register/register_response.dart';

import 'package:attendance_system/app/theme/constant.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class AuthService {
  Future<RegisterResponse> doRegister(RegisterRequest registerRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/signup"),
        headers: {"Content-Type": "application/json"},
        body: registerRequest.toJson());
    print("$response");
    if (response.statusCode == 201) {
      return RegisterResponse.fromMap(json.decode(response.body));
    } else {
      final err = RegisterResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message}");
    }
  }

  Future<LoginResponse> doLogin(LoginRequest loginRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/signin"),
        headers: {"Content-Type": "application/json"},
        body: loginRequest.toJson());
    if (response.statusCode == 200) {
      return LoginResponse.fromMap(json.decode(response.body));
    } else {
      final err = LoginResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message}");
    }
  }

  Future<ChangePasswordResponse> doChagePassword(
      ChangePasswordRequest changePasswordRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/change-password"),
        headers: {"Content-Type": "application/json"},
        body: changePasswordRequest.toJson());

    if (response.statusCode == 200) {
      return ChangePasswordResponse.fromMap(json.decode(response.body));
    } else {
      final err = ChangePasswordResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message}");
    }
  }

  Future<UserResponse> currentUser() async {
    final token = await authRepository.getToken();
    print(token);
    final response = await http.get(Uri.parse("$baseUrl/bearer-auth"),
        headers: headers(token));
    if (response.statusCode == 200) {
      return UserResponse.fromMap(json.decode(response.body));
    } else {
      final err = UserResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message}");
    }
  }

  Future<ChangeUserResponse> changeUser(ChangeUser changeUser) async {
    final token = await authRepository.getToken();
    print(token);
    final response = await http.put(Uri.parse("$baseUrl/change-user"),
        headers: headersForm(token), body: changeUser.toMap());
    if (response.statusCode == 200) {
      return ChangeUserResponse.fromMap(json.decode(response.body));
    } else {
      final err = ChangeUserResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message}");
    }
  }

  Future<ChangeUserResponse> uploadDocument(
      List<int> bytes, String fileName, String username) async {
    final uri = Uri.parse("$baseUrl/change-user");
    var request = http.MultipartRequest('PUT', uri);

    final multiPartFile = http.MultipartFile.fromBytes(
      "profile",
      bytes,
      filename: fileName,
    );
    final Map<String, String> fields = {
      "username": username,
    };

    final token = await authRepository.getToken();
    request.files.add(multiPartFile);
    request.fields.addAll(fields);
    request.headers.addAll(headersForm(token));

    final http.StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    print("heh $responseData");
    if (statusCode == 200) {
      return ChangeUserResponse.fromMap(json.decode(responseData));
    } else {
      final err = ChangeUserResponse.fromMap(json.decode(responseData));
      throw Exception("${err.message}");
    }
  }
}
