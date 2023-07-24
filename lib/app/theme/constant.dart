import 'package:attendance_system/app/data/attendance_service.dart';
import 'package:attendance_system/app/data/auth_repository.dart';
import 'package:attendance_system/app/data/auth_service.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);




const defaultPadding = 16.0;
// const baseUrl = "https://lying-side-production.up.railway.app";
const baseUrl = "https://attendance-production-890c.up.railway.app/";

final authService = AuthService();
final authRepository = AuthRepository();
final attendancesService = AttendanceService();

Map<String, String> headers(String token) =>
    {"Content-Type": "application/json", "Authorization": "Bearer $token"};

Map<String, String> headersForm(String token) =>
    {"Authorization": "Bearer $token"};


