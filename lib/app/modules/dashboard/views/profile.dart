import 'dart:io';
import 'dart:ui';

import 'package:attendance_system/app/components/dialog.dart';
import 'package:attendance_system/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:get/get.dart';

import 'package:attendance_system/app/theme/constant.dart';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final controller = Get.put(DashboardController());
  final usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(() {
      return Scaffold(
        body: Container(
          child: Stack(
            children: [
              SizedBox(
                height: size.height * .3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: controller.image.value,
                      placeholder: (context, url) => Lottie.asset(
                          "assets/json/loading.json",
                          height: 38,
                          width: 38),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    ClipRRect(
                      // Clip it cleanly.
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.grey.withOpacity(0.1),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height,
                width: size.width,
                margin: EdgeInsets.only(top: size.height * .3),
                decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(controller.username.value,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18)),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            showCustomDialog(context, usernameController, () {
                              if (formKey.currentState!.validate()) {
                                controller.changeUser(
                                    usernameController.text.toString());
                              }
                            }, controller);
                            // if (controller.isSuccess.value)
                            //   Navigator.pop(context);
                          },
                          child: const Icon(Icons.edit),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(controller.email.value,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 14))
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  height: size.height * 0.6,
                  child: GestureDetector(
                      onTap: () async {
                        _onGalleryView();
                      },
                      child: controller.imagePath.value == ""
                          ? CachedNetworkImage(
                              imageUrl: controller.image.value,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => Lottie.asset(
                                  "assets/json/loading.json",
                                  height: 38,
                                  width: 38),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          : _showImage()))
            ],
          ),
        ),
      );
    });
  }

  _onUpload(String username) async {
    final fileName = controller.imageFile?.name;
    final bytes = await controller.imageFile?.readAsBytes();

    final newBytes = await controller.compressImage(bytes!);

    await controller.upload(newBytes, fileName!, username);

    print("${controller.isSuccess.value}");
    if (controller.isSuccess.value) {
      controller.imagePath.value = "";
    }
  }

  _onGalleryView() async {
    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;

    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    print("$pickedFile ${pickedFile?.path}");
    if (pickedFile != null) {
      controller.imageFile = pickedFile;
      controller.imagePath.value = pickedFile.path;
      print(
          "${controller.imagePath.value} ${controller.imageFile?.name} hehehe");
      _onUpload(controller.username.value);
    }
  }

  Widget _showImage() {
    return kIsWeb
        ? CircleAvatar(
            radius: defaultPadding,
            child: Image.network(
              controller.imagePath.toString(),
              height: 100,
              width: 100,
            ))
        : ClipRRect(
            borderRadius: BorderRadius.circular(defaultPadding * 4),
            child: Image.file(
              File(controller.imagePath.toString()),
              height: 120,
              width: 120,
              fit: BoxFit.fill,
            ));
  }
}
