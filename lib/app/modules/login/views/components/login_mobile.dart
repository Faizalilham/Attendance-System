import 'package:attendance_system/app/components/fade_animation.dart';
import 'package:attendance_system/app/components/fade_animation_controller.dart';
import 'package:attendance_system/app/components/responsive.dart';
import 'package:attendance_system/app/model/fade_in_animation.dart';

import 'package:attendance_system/app/modules/login/controllers/login_controller.dart';
import 'package:attendance_system/app/modules/register/controllers/register_controller.dart';
import 'package:attendance_system/app/modules/register/views/register_view.dart';
import 'package:attendance_system/app/routes/app_pages.dart';

import 'package:attendance_system/app/theme/constant.dart';

import 'package:attendance_system/app/theme/extension.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginPotrait extends StatelessWidget {
  final controller = Get.put(LoginController());
  LoginPotrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerA = Get.put(FadeInAnimationController());
    controllerA.animationIn();
    return Scaffold(body: Obx(() {
      return Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1000,
            animate: TAnimatePosition(
                leftBefore: -140,
                leftAfter: 0,
                bottomAfter: 0,
                bottomBefore: 0,
                rightAfter: 0,
                rightBefore: 100,
                topAfter: 0,
                topBefore: 0),
            child: Container(
                padding: const EdgeInsets.all(defaultPadding),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        if (Responsive.isMobile(context))
                          Image.asset("assets/images/login_images.png",
                              height: 200, width: 200),
                        if (!Responsive.isMobile(context))
                          const SizedBox(height: 150)
                        else
                          const SizedBox(height: 50),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: controller.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kolom tidak boleh kosong';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Username",
                              fillColor: secondaryColor,
                              filled: true,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              prefixIcon: const Icon(Icons.person),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    controller.email.clear();
                                  },
                                  child: const Icon(Icons.clear))),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: controller.password,
                          obscureText: controller.visibility.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kolom tidak boleh kosong';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            fillColor: secondaryColor,
                            filled: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            prefixIcon: const Icon(Icons.lock_outline_sharp),
                            suffixIcon: InkWell(
                                onTap: () {
                                  controller.visibility.value =
                                      !controller.visibility.value;
                                },
                                child: Icon(controller.visibility.value
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.FORGET_PASSWORD);
                            },
                            child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "Lupa Password?",
                                  style: TextStyle(color: primaryColor),
                                ))),
                        const SizedBox(height: 30),
                        controller.isLoadingLogin.value
                            ? CircularProgressIndicator()
                            : TextButton.icon(
                                style: TextButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 70),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding / 2,
                                  ),
                                ),
                                onPressed: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    controller.doLogin(
                                      controller.email.text.toString(),
                                      controller.password.text.toString()
                                    );
                                    
                                  }
                                },
                                icon: const Padding(
                                  padding:
                                      EdgeInsets.only(right: defaultPadding),
                                  child: Icon(Icons.login),
                                ),
                                label: const Text(
                                  "Masuk",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ).addNeumorphism(
                                topShadowColor: Color.fromARGB(255, 54, 54, 54),
                                bottomShadowColor: Colors.black54,
                              ),
                        const SizedBox(height: 30),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.lazyPut(()=>RegisterController());
                                    Get.to(() => RegisterView(),
                                        transition:
                                            Transition.downToUp,
                                        duration:
                                            const Duration(milliseconds: 600));
                                  },
                                text: "Daftar Disini",
                                style: TextStyle(color: primaryColor))
                          ], text: "Belum punya akun ? "),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ],
      );
    }));
  }
}
