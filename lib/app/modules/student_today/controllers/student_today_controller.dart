import 'dart:async';

import 'package:attendance_system/app/data/data_source/core/attendances.dart';
import 'package:attendance_system/app/data/data_source/core/students_response.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StudentTodayController extends GetxController {
  Rx<bool> shimmer = false.obs;
  var connectionStatus = 0.obs;

  final connectivity = Connectivity();
  RxList students = <StudentTodayResponse>[].obs;
  RxInt length = 0.obs;

  @override
  void onInit() {
    showShimmer();
    super.onInit();
  }

  Future showShimmer() async {
    shimmer(true);
    final result = await connectivity.checkConnectivity();
    checkConnectivity(result);
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");

    Timer(Duration(milliseconds: 2000), () {
      if (connectionStatus != 0) {
        attendancesService
            .getAllStudentToday(headers(token ?? ""))
            .then((value) {
          length(value.data.length);
          students(value.data);
          print("$length");
        }).catchError((value) {
          print("$value");
        });
      }

      shimmer(false);
    });

    shimmer.refresh();
    print("$shimmer $connectionStatus ${students.length}");
  }

  checkConnectivity(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        connectionStatus(2);
        break;
      case ConnectivityResult.wifi:
        connectionStatus(1);
        break;
      default:
        connectionStatus(0);
    }

    connectionStatus.refresh();
  }
}
