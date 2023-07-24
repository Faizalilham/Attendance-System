import 'package:attendance_system/app/components/fade_animation.dart';
import 'package:attendance_system/app/components/fade_animation_controller.dart';
import 'package:attendance_system/app/components/responsive.dart';
import 'package:attendance_system/app/model/fade_in_animation.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:attendance_system/app/theme/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
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
                          Image.asset("assets/images/register_images.png",
                              height: 200, width: 200),
                        if (!Responsive.isMobile(context))
                          const SizedBox(height: 150)
                        else
                          const SizedBox(height: 50),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: controller.username,
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
                                    controller.username.clear();
                                  },
                                  child: const Icon(Icons.clear))),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: controller.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Kolom tidak boleh kosong';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Email",
                              fillColor: secondaryColor,
                              filled: true,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              prefixIcon: const Icon(Icons.email),
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
                        TextFormField(
                          controller: controller.re_password,
                          obscureText: controller.visibilitys.value,
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
                                  controller.visibilitys.value =
                                      !controller.visibilitys.value;
                                },
                                child: Icon(controller.visibilitys.value
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                        ),
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
                                    controller.doRegister(
                                        controller.username.text.toString(),
                                        controller.email.text.toString(),
                                        controller.password.text.toString(),
                                        controller.re_password.text.toString()
                                    );
                                  }
                                },
                                icon: const Padding(
                                  padding:
                                      EdgeInsets.only(right: defaultPadding),
                                  child: Icon(Icons.login),
                                ),
                                label: const Text(
                                  "Daftar",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ).addNeumorphism(
                                topShadowColor: const Color.fromARGB(255, 54, 54, 54),
                                bottomShadowColor: Colors.black54,
                              ),
                        const SizedBox(height: 30),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.back();
                                  },
                                text: "Login",
                                style: const TextStyle(color: primaryColor))
                          ], text: "Sudah punya akun ? "),
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
