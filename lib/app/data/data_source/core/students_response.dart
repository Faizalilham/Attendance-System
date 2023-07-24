class Student {
  String name;
  String nim;
  String email;
  String address;
  String images;

  Student(
      {required this.name,
      required this.nim,
      required this.email,
      required this.address,
      required this.images});

  factory Student.fromMap(Map<String, dynamic> json) {
    return Student(
        name: json["name"],
        nim: json["nim"],
        email: json["email"],
        address: json["address"],
        images: json["images"]);
  }
}

class StudentsResponse {
  String message;
  List<Student> data;

  StudentsResponse({required this.message, required this.data});

  factory StudentsResponse.fromMap(Map<String, dynamic> json) {
    return StudentsResponse(
        message: json["message"],
        data: List<Student>.from(
            (json["data"] as List).map((e) => Student.fromMap(e))));
  }
}

class StudentsTodayResponse {
  String message;
  List<Student> data;

  StudentsTodayResponse({required this.message, required this.data});

  factory StudentsTodayResponse.fromMap(Map<String, dynamic> json) {
    return StudentsTodayResponse(
        message: json["message"],
        data: List<Student>.from(
            (json["data"] as List).map((e) => Student.fromMap(e))));
  }
}
