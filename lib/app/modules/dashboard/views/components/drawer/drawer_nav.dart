import 'package:attendance_system/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:attendance_system/app/modules/dashboard/views/components/drawer/list_item_drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DrawerNav extends StatelessWidget {
  DrawerNav({Key? key}) : super(key: key);
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
        children: [
          DrawerHeader(child: Obx(() {
            return Column(children: [
              CachedNetworkImage(
                  imageUrl: controller.image.value,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 90.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image:
                          DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Lottie.asset(
                      "assets/json/loading.json",
                      height: 38,
                      width: 38),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              SizedBox(height:20),
              Text(controller.email.value)
            ]);
          })),
        const Expanded(child: ListItemDrawer())
      ],
    ));
  }
}
