import 'package:attendance_system/app/components/fade_animation.dart';
import 'package:attendance_system/app/components/fade_animation_controller.dart';
import 'package:attendance_system/app/components/responsive.dart';
import 'package:attendance_system/app/model/fade_in_animation.dart';
import 'package:attendance_system/app/modules/forget_password/controllers/forget_password_controller.dart';

import 'package:attendance_system/app/theme/constant.dart';

import 'package:attendance_system/app/theme/extension.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ForgetPasswordMobile extends StatelessWidget {
  final controller = Get.find<ForgetPasswordController>();
  ForgetPasswordMobile({Key? key}) : super(key: key);

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
                          Image.asset(
                              "assets/images/forget_password_images.png",
                              height: 200,
                              width: 200),
                        if (!Responsive.isMobile(context))
                          const SizedBox(height: 200)
                        else
                          const SizedBox(height: 50),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Ubah Password",
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
                            hintText: "Masukkan Email",
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
                                child: const Icon(Icons.clear)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        controller.isLoadingChangePassword.value
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
                                    controller.doChangePassword(
                                        controller.email.text.toString());
                                  }
                                },
                                icon: const Padding(
                                  padding:
                                      EdgeInsets.only(right: defaultPadding),
                                  child: Icon(Icons.edit),
                                ),
                                label: const Text(
                                  "Ubah Password",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ).addNeumorphism(
                                topShadowColor:
                                    const Color.fromARGB(255, 54, 54, 54),
                                bottomShadowColor: Colors.black54,
                              ),
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
