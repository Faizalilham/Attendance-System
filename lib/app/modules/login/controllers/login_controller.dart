import 'dart:async';
import 'package:attendance_system/app/data/data_source/auth/login/login_request.dart';
import 'package:attendance_system/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:attendance_system/app/routes/app_pages.dart';
import 'package:attendance_system/app/theme/constant.dart';

import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  RxBool visibility = true.obs;
  RxBool isLoadingLogin = false.obs;

  void doLogin(String email, String password) {
    isLoadingLogin.value = true;
    Timer(const Duration(seconds: 3), () {
      authService
          .doLogin(LoginRequest(email: email, password: password))
          .then((value) {
        authRepository.setLogin();
        authRepository.setToken(value.token.toString());
        Get.showSnackbar(GetSnackBar(
            message: value.message,
            title: "Success",
            padding: const EdgeInsets.all(defaultPadding),
            margin: const EdgeInsets.all(defaultPadding / 2),
            duration: const Duration(milliseconds: 2000)));
        DashboardBinding().dependencies();
        Get.offAllNamed(Routes.DASHBOARD);
      }).catchError((value) {
        Get.showSnackbar(GetSnackBar(
            message: "$value",
            title: "Error",
            padding: const EdgeInsets.all(defaultPadding),
            margin: const EdgeInsets.all(defaultPadding / 2),
            duration: const Duration(milliseconds: 2000)));
      });

      isLoadingLogin(false);
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
