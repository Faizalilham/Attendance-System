import 'dart:async';

import 'package:attendance_system/app/components/waiting_screen.dart';
import 'package:attendance_system/app/data/data_source/auth/change_password/change_password.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();

  RxBool isLoadingChangePassword = false.obs;

  void doChangePassword(String email) {
    isLoadingChangePassword(true);
    Timer(const Duration(seconds: 3), () {
      print("$isLoadingChangePassword hehehe");
      authService
          .doChagePassword(ChangePasswordRequest(email: email))
          .then((value) {
        Get.showSnackbar(GetSnackBar(
            message: value.message,
            title: "Success",
            padding: const EdgeInsets.all(defaultPadding),
            margin: const EdgeInsets.all(defaultPadding / 2),
            duration: const Duration(milliseconds: 2000)));
        Get.to(() => WaitingScreen(),
            transition: Transition.leftToRightWithFade,
            duration: const Duration(milliseconds: 1200));
      }).catchError((value) {
        Get.showSnackbar(GetSnackBar(
            message: value.message,
            title: "Error",
            padding: const EdgeInsets.all(defaultPadding),
            margin: const EdgeInsets.all(defaultPadding / 2),
            duration: const Duration(milliseconds: 2000)));
      });
      isLoadingChangePassword(false);
    });

    
  }
}
