import 'package:attendance_system/app/components/responsive.dart';
import 'package:attendance_system/app/modules/forget_password/views/components/forget_password_desktop.dart';
import 'package:attendance_system/app/modules/forget_password/views/components/forget_password_mobile.dart';
import 'package:attendance_system/app/modules/forget_password/views/components/forget_password_tablet.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(

        mobile: ForgetPasswordMobile(), 
        tablet: ForgetPasswordTablet(),
        desktop: ForgetPasswordDesktop());
  }
}
