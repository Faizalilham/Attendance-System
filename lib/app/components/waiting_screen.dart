
import 'package:attendance_system/app/routes/app_pages.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:attendance_system/app/theme/extension.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/json/email.json", height: 200, width: 200),
              Text(
                "please check your email to verify the email that you have registered",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 70),
                  padding: const EdgeInsets.only(top:defaultPadding / 2)
                ),
                onPressed: () async {
                  DeviceApps.openApp('com.google.android.gm');
                },
                icon: const Padding(
                  padding:  EdgeInsets.symmetric(
                      vertical: defaultPadding / 4,
                      horizontal: defaultPadding / 2
                  ),
                  child: Icon(Icons.email),
                ),
                label: const Text(
                  "Buka Email",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ).addNeumorphism(
                topShadowColor: const Color.fromARGB(255, 54, 54, 54),
                bottomShadowColor: Colors.black54,
              ),
              OutlinedButton(
              
                onPressed: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all( const EdgeInsets.symmetric(
                    vertical: defaultPadding / 4,
                    horizontal:  defaultPadding / 2
                  ),),
                  minimumSize: MaterialStateProperty.all( const Size(double.infinity, 70)),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.white70, width: 2)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
                ),
                child: const Text("Kembali ke login",style: TextStyle(color: Colors.white70),),
              )
            ],
          )),
    );
  }
}
