import 'package:attendance_system/app/components/app_bar.dart';
import 'package:attendance_system/app/components/no_connection_screen.dart';
import 'package:attendance_system/app/modules/dashboard/views/components/card_student.dart';
import 'package:attendance_system/app/modules/student_today/controllers/student_today_controller.dart';
import 'package:attendance_system/app/modules/students/views/components/shimmer_card_student.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class StudentTodayView extends GetView<StudentTodayController> {
  const StudentTodayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarC("Students Today"),
        body: Obx(() {
          return controller.connectionStatus == 0
              ? NoConnectionScreen()
              : Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: controller.students.length,
                        itemBuilder: (ctx, index) {
                          print("${controller.shimmer.value} xixix");
                          return controller.shimmer.value
                              ? const ShimmerCardStudent()
                              : CardStudent(
                                  student: null ,
                                  Str: controller.students[index],
                                  );
                        }),
                  ),
                );
        }));
  }
}
