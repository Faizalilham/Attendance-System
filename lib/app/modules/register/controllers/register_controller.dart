import 'dart:async';
import 'package:attendance_system/app/components/waiting_screen.dart';
import 'package:attendance_system/app/data/data_source/auth/register/register_request.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController re_password = TextEditingController();

  RxBool visibility = true.obs;
  RxBool visibilitys = true.obs;
  RxBool isLoadingLogin = false.obs;

  void doRegister(
      String username, String email, String password,String re_password) {
    isLoadingLogin.value = true;
    Timer(const Duration(seconds: 3), () {
      if (email.contains("@")) {
        authService
            .doRegister(RegisterRequest(
                username: username,
                email: email,
                password: password,
                re_password: re_password))
            .then((value) {
          Get.showSnackbar(GetSnackBar(
            message: value.message,
            title: "Success",
            padding: const EdgeInsets.all(defaultPadding),
            margin: const EdgeInsets.all(defaultPadding / 2),
            duration: const Duration(milliseconds: 2000),
          ));
          Get.offAll(() => WaitingScreen(),
              transition: Transition.leftToRightWithFade,
              duration: const Duration(milliseconds: 1000),
              );
          isLoadingLogin(false);
        }).catchError((value) {
          Get.showSnackbar(GetSnackBar(
            message: "$value",
            title: "Error",
            padding: const EdgeInsets.all(defaultPadding),
            margin: const EdgeInsets.all(defaultPadding / 2),
            duration: const Duration(milliseconds: 2000),
          ));
          isLoadingLogin(false);
        });
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: "Invalid email",
          title: "Error",
          padding: EdgeInsets.all(defaultPadding),
          margin: EdgeInsets.all(defaultPadding / 2),
          duration: Duration(milliseconds: 2000),
        ));
      }
    });
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    re_password.dispose();
    super.dispose();
  }
}
