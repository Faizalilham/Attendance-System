import 'package:attendance_system/app/components/responsive.dart';
import 'package:attendance_system/app/modules/login/views/components/login_desktop.dart';
import 'package:attendance_system/app/modules/login/views/components/login_mobile.dart';
import 'package:attendance_system/app/modules/login/views/components/login_tablet.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Responsive(
            mobile: LoginPotrait(),
            tablet: LoginTablet(),
            desktop: LoginLandscape()));
  }
}
