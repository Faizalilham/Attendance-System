import 'package:attendance_system/app/components/responsive.dart';
import 'package:attendance_system/app/model/dashboard_menu.dart';
import 'package:attendance_system/app/modules/student_today/controllers/student_today_controller.dart';
import 'package:attendance_system/app/modules/students/controllers/students_controller.dart';
import 'package:attendance_system/app/routes/app_pages.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:attendance_system/app/theme/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardDashboardMenu extends StatelessWidget {
  
  final controller = Get.put(StudentsController());
  final controller2 = Get.put(StudentTodayController());

  CardDashboardMenu({
    Key? key,
    required this.menu,
    required this.index
  }) : super(key: key);

  final DashboardMenu menu;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(index != 1) {
          Get.toNamed(Routes.STUDENTS);
        } else{
          Get.toNamed(Routes.STUDENT_TODAY);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: Responsive.isMobile(context)
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    menu.tittle!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(defaultPadding * 0.75),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: menu.color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SvgPicture.asset(
                    menu.icon!,
                    color: menu.color,
                  ),
                ),
              ],
            ),
            index == 1 ?  Text(
                 "${controller2.length} Siswa",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                   TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ) :
            Obx(() {
              return Text(
                 "${controller.length} siswa",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            }),
            index == 1 ? ProgressLine(
                color: menu.color,
                percentage:  100 ,
              ) :
            Obx(() {
              return ProgressLine(
                color: menu.color,
                percentage:  controller.length.value,
              );
            })
          ],
        ),
      ).addNeumorphism(
        topShadowColor: const Color.fromARGB(255, 54, 54, 54),
        bottomShadowColor: Colors.black54,
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 20),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
