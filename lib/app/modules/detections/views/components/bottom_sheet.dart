import 'package:attendance_system/app/components/responsive.dart';
import 'package:attendance_system/app/data/data_source/core/students_response.dart';

import 'package:attendance_system/app/modules/dashboard/views/components/card_student.dart';
import 'package:attendance_system/app/modules/detections/controllers/detections_controller.dart';

import 'package:attendance_system/app/theme/constant.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomSheetC extends StatelessWidget {
  Widget camera;
  BottomSheetC({Key? key, required this.camera}) : super(key: key);
  final controller = Get.put(DetectionsController());
  List<Student> datas = [
    Student(
        name: "Faizal",
        nim: "2000000",
        email: "admin@gmail.com",
        address: "Pangkah",
        images:
            "https://res.cloudinary.com/dmhpacb7m/image/upload/v1683388383/drown/hvswvejslyqyguz6amgy.png"),
    Student(
        name: "Faizal",
        nim: "2000000",
        email: "admin@gmail.com",
        address: "Pangkah",
        images:
            "https://res.cloudinary.com/dmhpacb7m/image/upload/v1683388383/drown/hvswvejslyqyguz6amgy.png")
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DetectionsController>();
    controller.postStudent(datas);
    Size size = MediaQuery.of(context).size;
    return SlidingUpPanel(
      color: secondaryColor,
      controller: controller.panelController,
      body: camera,
      parallaxEnabled: true,
      maxHeight: size.height * 0.8,
      minHeight: size.height * 0.1,
      panel: Container(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => controller.toggle(),
              child: Center(
                  child: Container(
                margin: const EdgeInsets.only(bottom: defaultPadding),
                height: Responsive.isMobile(context) ? 5 : 20,
                width: Responsive.isMobile(context) ? 50 : 200,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: primaryColor),
              )),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: datas.length,
                  itemBuilder: (ctx, index) {
                    return CardStudent(
                      student: datas[index],
                      Str:null
                      );
                  }),
            )
          ],
        ),
      ),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
    );
  }
}
