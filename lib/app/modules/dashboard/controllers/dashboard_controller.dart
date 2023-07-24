import 'dart:async';

import 'package:attendance_system/app/data/data_source/auth/change_user/change_user.dart';

import 'package:attendance_system/app/modules/login/views/login_view.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import 'package:image/image.dart' as img;

class DashboardController extends GetxController {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  

  RxBool isLoadingDashboard = true.obs;
  RxBool isLoadingChangeUsername = false.obs;

  RxString username = "".obs;
  RxString image =
      "https://res.cloudinary.com/dmhpacb7m/image/upload/v1683388383/drown/hvswvejslyqyguz6amgy.png"
          .obs;

  RxString email = "".obs;
  RxBool isSuccess = false.obs;

  RxList countGraph = [].obs;
  RxList nameGraph = [].obs;

  Rx<String> imagePath = "".obs;

  XFile? imageFile;

  RxBool isUploading = false.obs;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  void onInit() {
    dataGraph();
    currentUser();
    loadData();
    super.onInit();
  }

  void loadData() {
    isLoadingDashboard(true);
    Timer(const Duration(milliseconds: 4000), () {
      isLoadingDashboard(false);
    });

    isLoadingDashboard.refresh();
  }

  void currentUser() {
    authService.currentUser().then((value) {
      username(value.data?.username);
      email(value.data?.email);
      image(value.data?.image);
      print("${value.data?.image} hhex");
    }).catchError((value) {
      authRepository.deleteToken();
      authRepository.isLogout();
      Get.offAll(
        () => LoginView(),
        transition: Transition.leftToRightWithFade,
        duration: const Duration(milliseconds: 600),
      );
    });
  }

  void changeUser(String username) {
    isLoadingChangeUsername(true);
    Timer(const Duration(milliseconds: 3000), () {
      authService.changeUser(ChangeUser(username: username)).then((value) {
        this.username(value.data?.username);
        email(value.data?.email);
        image(value.data?.image);
        print("${value.data?.image} hege");
        isSuccess(true);
        Get.showSnackbar(GetSnackBar(
            message: value.message,
            title: "Success",
            padding: const EdgeInsets.all(defaultPadding),
            margin: const EdgeInsets.all(defaultPadding / 2),
            duration: const Duration(milliseconds: 2000)));
      }).catchError((value) {
        isSuccess(false);
        Get.showSnackbar(GetSnackBar(
            message: "$value",
            title: "Error",
            padding: const EdgeInsets.all(defaultPadding),
            margin: const EdgeInsets.all(defaultPadding / 2),
            duration: const Duration(milliseconds: 2000)));
      });
      isLoadingChangeUsername(false);
    });
  }

  void dataGraph() {
    attendancesService.getGraph().then((value) {
      print("${value.data}  hehee");
      value.data.forEach((element) {
        countGraph.add(element.count.toDouble());
        nameGraph.add(element.name);
      });
      print("$countGraph");
    }).catchError((value) {
      print("$value hh");
    });
  }

  Future<void> upload(
    List<int> bytes,
    String fileName,
    String username,
  ) async {
    try {
      // isUploading(true);

      authService.uploadDocument(bytes, fileName, username).then((value) {
        this.username(value.data?.username);
        email(value.data?.email);
        image(value.data?.image);
         Get.showSnackbar(GetSnackBar(
            message: value.message,
            title: "Success",
            padding: const EdgeInsets.all(defaultPadding),
            margin: const EdgeInsets.all(defaultPadding / 2),
            duration: const Duration(milliseconds: 2000)));
        
      }).catchError((value) {});
    } catch (e) {
      print("$e hehex");
    }
  }

  Future<List<int>> compressImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;

    final img.Image image = img.decodeImage(bytes)!;
    int compressQuality = 100;
    int length = imageLength;
    List<int> newByte = [];

    do {
      ///
      compressQuality -= 10;

      newByte = img.encodeJpg(
        image,
        quality: compressQuality,
      );

      length = newByte.length;
    } while (length > 1000000);

    return newByte;
  }

  Future<List<int>> resizeImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;

    final img.Image image = img.decodeImage(bytes)!;
    bool isWidthMoreTaller = image.width > image.height;
    int imageTall = isWidthMoreTaller ? image.width : image.height;
    double compressTall = 1;
    int length = imageLength;
    List<int> newByte = bytes;

    do {
      compressTall -= 0.1;

      final newImage = img.copyResize(
        image,
        width: isWidthMoreTaller ? (imageTall * compressTall).toInt() : null,
        height: !isWidthMoreTaller ? (imageTall * compressTall).toInt() : null,
      );

      length = newImage.length;
      if (length < 1000000) {
        newByte = img.encodeJpg(newImage);
      }
    } while (length > 1000000);

    return newByte;
  }
}
