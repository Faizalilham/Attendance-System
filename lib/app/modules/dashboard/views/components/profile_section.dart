import 'package:attendance_system/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    
    final controller = Get.put(DashboardController());
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: InkWell(
        onTap: () {
          DefaultTabController.of(context)!.animateTo(1);
        },
        child: Row(
          children: [
            Obx((){
              return CachedNetworkImage(
                  imageUrl: controller.image.value,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 40.0,
                    height: 40.0,
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
                );
            }),
            if (size > 340)
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2),
                  child: Text(controller.username.value),
                );
              })
          ],
        ),
      ),
    );
  }
}
