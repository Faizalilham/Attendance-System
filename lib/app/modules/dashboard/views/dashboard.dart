import 'package:attendance_system/app/components/responsive.dart';

import 'package:attendance_system/app/model/graph_data.dart';
import 'package:attendance_system/app/modules/dashboard/controllers/dashboard_controller.dart';

import 'package:attendance_system/app/modules/dashboard/views/components/drawer/drawer_nav.dart';

import 'package:attendance_system/app/modules/dashboard/views/components/graph.dart';

import 'package:attendance_system/app/modules/dashboard/views/components/header.dart';

import 'package:attendance_system/app/modules/dashboard/views/components/menus.dart';

import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import 'package:attendance_system/app/theme/constant.dart';

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        drawer: DrawerNav(),
        body: Obx(() {
          return controller.isLoadingDashboard.value
              ? Center(
                  child: Lottie.asset("assets/json/loading.json"),
                )
              : SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (Responsive.isDesktop(context))
                        Expanded(
                          child: DrawerNav(),
                        ),
                      Expanded(
                        flex: 5,
                        child: SingleChildScrollView(
                          primary: false,
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Column(
                            children: [
                              Header(
                                onPress: () => controller.controlMenu(),
                              ),
                              const SizedBox(height: defaultPadding),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Column(children: [
                                      const Menus(),
                                      const SizedBox(
                                          height: defaultPadding + 4),
                                      if (Responsive.isMobile(context))
                                        BarGraph(graph_data:  controller.countGraph,graph_tittle:controller.nameGraph)
                                    ]),
                                  ),
                                  if (!Responsive.isMobile(context))
                                    const SizedBox(width: defaultPadding),
                                  if (!Responsive.isMobile(context))
                                    Expanded(
                                      flex: 3,
                                      child: BarGraph(graph_data:controller.countGraph,graph_tittle: controller.nameGraph),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        }));
  }
}
