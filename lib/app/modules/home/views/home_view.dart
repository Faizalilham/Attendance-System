import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
   controller.timerSplashScreen(2);
    return Scaffold(
      body: Center(
          child: Image.asset("assets/images/danilla.png",
              height: 200, width: 200)),
    );
  }
}
