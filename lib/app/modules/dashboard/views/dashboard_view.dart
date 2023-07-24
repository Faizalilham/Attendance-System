import 'package:attendance_system/app/modules/dashboard/views/dashboard.dart';

import 'package:attendance_system/app/modules/dashboard/views/profile.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: TabBarView(
        children: [
          Dashboard(),
          Profile()
        ]
      )
    );
  }
}
