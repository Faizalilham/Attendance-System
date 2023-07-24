import 'dart:convert';

import 'package:attendance_system/app/data/data_source/core/attendances.dart';
import 'package:attendance_system/app/data/data_source/core/graph_response.dart';

import 'package:attendance_system/app/data/data_source/core/students_response.dart';

import 'package:attendance_system/app/theme/constant.dart';

import 'package:http/http.dart' as http;

class AttendanceService {
  Future<StudentsResponse> getAllStudent(Map<String, String> headers) async {
    final response =
        await http.get(Uri.parse("$baseUrl/students"), headers: headers);

    if (response.statusCode == 200) {
      return StudentsResponse.fromMap(json.decode(response.body));
    } else {
      final err = StudentsResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message}");
    }
  }

  Future<Attendances> getAllStudentToday(Map<String, String> headers) async {
    final response =
        await http.get(Uri.parse("$baseUrl/attendances"), headers: headers);

    print("${response.body} uhuyy");
    if (response.statusCode == 200) {
      return Attendances.fromMap(json.decode(response.body));
    } else {

      final err = Attendances.fromMap(json.decode(response.body));
      print("${err.message} uhuy");
      throw Exception("${err.message}");
      
    }
  }

  Future<GraphResponse> getGraph() async {
    final token = await authRepository.getToken();
    final response =
        await http.get(Uri.parse("$baseUrl/graph"), headers: headers(token));
    print("${response.body}");
    if (response.statusCode == 200) {
      return GraphResponse.fromMap(json.decode(response.body));
    } else {
      return GraphResponse.fromMap(json.decode(response.body));
    }
  }

  Future<AttendanceResponse> postStudent(
      AttendanceRequest attendanceRequest, Map<String, String> headers) async {
    final response = await http.post(Uri.parse("$baseUrl/student-attendance"),
        body: attendanceRequest.toJson(), headers: headers);

    if (response.statusCode == 200) {
      return AttendanceResponse.fromMap(json.decode(response.body));
    } else {
      final err = AttendanceResponse.fromMap(json.decode(response.body));
      throw Exception("${err.message}");
    }
  }
}
