import 'dart:async';

import 'package:attendance_system/app/data/data_source/core/attendances.dart';
import 'package:attendance_system/app/data/data_source/core/students_response.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:camera/camera.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetectionsController extends GetxController {
  late List<CameraDescription> cameras;

  RxList<Student> listStudent = <Student>[].obs;

  PanelController panelController = PanelController();

  void toggle() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  void processDetectedStudent(String student) {
    if (listStudent.any((student) => student.name != student)) {
      listStudent.add(Student(
          name: student, nim: "20090086", address: "", images: "", email: ""));
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future postStudent(List<Student> ar) async {
     DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");

    Timer(Duration(milliseconds: 2000), () {
      ar.forEach((element) {
        attendancesService
            .postStudent(AttendanceRequest(name: element.name, date: formattedDate, description: "Hadir"), headers(token ?? ""))
            .then((value) {
          print("$value hehex");
        }).catchError((value) {
          print("$value");
        });
      });
    });
  }

  // @override
  // void onInit()async{
  //   a();
  //   cameras = await availableCameras();
  //   super.onInit();
  // }

  // void a() async {
  //   // WidgetsFlutterBinding.ensureInitialized();
  //   try {
  //     cameras = await availableCameras();
  //   } on CameraException catch (e) {
  //     print('Error: $e.code\nError Message: $e.message');
  //   }
  // }

}
