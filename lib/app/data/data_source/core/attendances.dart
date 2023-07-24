import 'dart:convert';

class AttendanceRequest {
  String name;
  String date;
  String description;

  AttendanceRequest(
      {required this.name, required this.date, required this.description});

  Map<String, dynamic> toMap() {
    return {"name": name, "date": date, "description": description};
  }

  String toJson() => json.encode(toMap());
}

class AttendanceResponse {
  String message;

  AttendanceResponse(
      {required this.message});

  factory AttendanceResponse.fromMap(Map<String, dynamic> json) {
    return AttendanceResponse(
        message: json["message"]);
  }

}

class StudentTodayResponse {
  String name;
  String date;
  String description;

  StudentTodayResponse(
      {required this.name, required this.date, required this.description});

  factory StudentTodayResponse.fromMap(Map<String, dynamic> json) {
    return StudentTodayResponse(
        name: json["name"],
        date: json["date"],
        description: json["description"]);
  }
}

class Attendances {
  List<StudentTodayResponse> data;
  String message;
  
  Attendances({required this.message, required this.data});

  factory Attendances.fromMap(Map<String, dynamic> json) {
    List<StudentTodayResponse> uniqueData = [];
    Set<String> uniqueKeys = Set<String>();

    (json["data"] as List).forEach((item) {
      StudentTodayResponse student = StudentTodayResponse.fromMap(item);
      String key = '${student.name}-${student.date}-${student.description}';

      if (!uniqueKeys.contains(key)) {
        uniqueKeys.add(key);
        uniqueData.add(student);
      }
    });

    return Attendances(
      data: uniqueData,
      message: json["message"],
    );
  }
}
