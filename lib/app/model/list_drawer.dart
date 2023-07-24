import 'package:attendance_system/app/modules/detections/controllers/detections_controller.dart';
import 'package:attendance_system/app/modules/detections/views/detections_view.dart';
import 'package:attendance_system/app/routes/app_pages.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';

class ListDrawer {
  final int id;
  final String image;
  final String tittle;

  ListDrawer({required this.id, required this.image, required this.tittle});
}

final listDrawer = [
  ListDrawer(id: 0, image: "assets/Icons/ic_detection.svg", tittle: "Deteksi"),
  ListDrawer(id: 2, image: "assets/Icons/logout.svg", tittle: "Keluar"),
];

navigation(int index) async {
  if (index == 0) {
    // (await Tflite.loadModel(
    //   model: "assets/yolov2_tiny.tflite",
    //   labels: "assets/yolov2_tiny.txt",
    // ))!;
    // Get.to(() => DetectionsView(),
    //     transition: Transition.leftToRightWithFade,
    //     duration: const Duration(milliseconds: 1200));
    // Get.lazyPut(() => DetectionsController());
    DeviceApps.openApp('org.tensorflow.lite.examples.objectdetection');

  } else if (index == 2) {
    Get.defaultDialog(
        titlePadding: const EdgeInsets.all(defaultPadding / 2),
        title: "Keluar",
        middleText: "Apakah anda yakin ingin keluar",
        backgroundColor: secondaryColor,
        titleStyle: const TextStyle(color: Colors.white),
        middleTextStyle: const TextStyle(color: Colors.white),
        radius: 10,
        cancel: InkWell(
          onTap: () {
            Get.back(closeOverlays: true);
          },
          child: const Text("Tidak"),
        ),
        confirm: InkWell(
          onTap: () {
            authRepository.deleteToken();
            authRepository.isLogout();
            Get.offAllNamed(Routes.LOGIN);
          },
          child: const Text("Ya"),
        ));
  } else {
    Get.toNamed(Routes.DASHBOARD);
  }
}
