import 'package:attendance_system/app/components/responsive.dart';
import 'package:attendance_system/app/model/dashboard_menu.dart';
import 'package:attendance_system/app/modules/dashboard/views/components/card_dashboard_menu.dart';
import 'package:attendance_system/app/modules/students/controllers/students_controller.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menus extends StatelessWidget {
  const Menus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 2,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: const FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dashboardMenus.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) => 
              CardDashboardMenu(menu: dashboardMenus[index],index:index)
            );
  }
}



RxList dashboardMenus = [
  DashboardMenu(
      tittle: "Jumlah Siswa",
      icon: "assets/Icons/File.svg",
      count: 0,
      color: primaryColor),
  DashboardMenu(
    tittle: "Siswa Hadir hari ini",
    icon: "assets/Icons/File.svg",
    count: 20,
    color: const Color(0xFFA4CDFF),
  )
].obs;
