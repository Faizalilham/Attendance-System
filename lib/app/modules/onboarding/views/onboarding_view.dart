import 'package:attendance_system/app/routes/app_pages.dart';
import 'package:attendance_system/app/theme/constant.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:introduction_screen/introduction_screen.dart';

import 'package:lottie/lottie.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16),
        bodyPadding: EdgeInsets.all(defaultPadding));
    return IntroductionScreen(
      globalBackgroundColor: bgColor,
      pages: [
        PageViewModel(
            title: "Welcome to smart attendance system",
            body: "Holla..! welcome to the automatic attendance system application",
            image: Lottie.asset("assets/json/on_boarding_0.json"),
            decoration: pageDecoration),
        PageViewModel(
            title: "Attendance with method object detection",
            body: "Speed ​​up your attendance by using the object detection method",
            image: Lottie.asset("assets/json/on_boarding_1.json"),
            decoration: pageDecoration),
        PageViewModel(
            title: "Visualisation data",
            body: "Read attendance data easily using bar graphs",
            image: Lottie.asset("assets/json/on_boarding_2.json"),
            decoration: pageDecoration)
      ],
      showSkipButton: false,
      showNextButton: true,
      showDoneButton: true,
      showBackButton: true,
      dotsFlex: 3,
      nextFlex: 1,
      skipOrBackFlex: 1,
      back: const Icon(Icons.arrow_back),
      skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.bold)),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.bold)),
      dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Color(0xFFA4CDFF),
          activeColor: primaryColor,
          activeSize: Size(24, 10),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      onDone: () async {
        Get.offAllNamed(Routes.LOGIN);
        final a = Get.put(OnboardingController());
        a.setKey();
      },
    );
  }
}
