import 'package:attendance_system/app/modules/login/views/components/login_mobile.dart';
import 'package:attendance_system/app/theme/constant.dart';

import 'package:flutter/material.dart';

class LoginTablet extends StatelessWidget {
  LoginTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: defaultPadding),
        child: Row(
          children: [
            Expanded(
                child: Container(
                  child: Image.asset("assets/images/login_images.png",
                      height: 200, width: 200),
                )),
            Expanded(child: LoginPotrait())
          ],
        ),
      ),
    );
  }
}
