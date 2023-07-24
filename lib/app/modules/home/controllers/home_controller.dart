import 'dart:async';
import 'package:attendance_system/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:attendance_system/app/modules/dashboard/views/dashboard_view.dart';
import 'package:attendance_system/app/modules/login/controllers/login_controller.dart';

import 'package:attendance_system/app/modules/login/views/login_view.dart';

import 'package:attendance_system/app/modules/onboarding/views/onboarding_view.dart';
import 'package:attendance_system/app/theme/constant.dart';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  void timerSplashScreen(int timer) {
    Get.put(LoginController());
    Timer(Duration(seconds: timer), () => oneTimeIsIt());
  }

  Future oneTimeIsIt() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var key = sharedPreferences.getBool("keys");
    print("key is $key");
    if (key != null) {
      if (key) {
        final isLogin = await authRepository.isLogin();
        print("$isLogin hehe");
        if (isLogin) {
          Get.put(DashboardController());
          Get.offAll(() => const DashboardView(),
              transition: Transition.upToDown,
              duration: const Duration(milliseconds: 600));
        }else{
           Get.offAll(() => const LoginView(),
              transition: Transition.upToDown,
              duration: const Duration(milliseconds: 600));
        }
       
      }
    } else {
      Get.offAll(() => const OnboardingView(),
          transition: Transition.upToDown,
          duration: const Duration(milliseconds: 600));
    }
  }
}
