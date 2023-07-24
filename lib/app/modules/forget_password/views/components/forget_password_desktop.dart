
import 'package:attendance_system/app/modules/forget_password/views/components/forget_password_mobile.dart';
import 'package:attendance_system/app/modules/login/views/components/login_mobile.dart';
import 'package:attendance_system/app/theme/constant.dart';

import 'package:flutter/material.dart';



class ForgetPasswordDesktop extends StatelessWidget {
  ForgetPasswordDesktop({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: defaultPadding),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(child:Image.asset("assets/images/danilla.png", height: 200, width: 200),)),
            Expanded(
                child: ForgetPasswordMobile()
            )
          ],
        ),
      ),
    );
  }
}