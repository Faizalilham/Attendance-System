import 'package:attendance_system/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:attendance_system/app/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final formKey = GlobalKey<FormState>();
void showCustomDialog(BuildContext context, TextEditingController controller,
    Function() post, DashboardController dc) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
            height: 500,
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            padding: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding - 4),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 30),
                  blurRadius: 60,
                ),
                const BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 30),
                  blurRadius: 60,
                ),
              ],
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Text(
                            "Change Username",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 50),
                          TextFormField(
                            controller: controller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kolom tidak boleh kosong';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                fillColor: secondaryColor,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                prefixIcon: const Icon(Icons.person),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      controller.clear();
                                    },
                                    child: const Icon(Icons.clear))),
                          ),
                          const SizedBox(height: 30),
                          Obx(() {
                            return dc.isLoadingChangeUsername.value
                                ? CircularProgressIndicator()
                                : OutlinedButton(
                                    onPressed: post,
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: defaultPadding / 4,
                                            horizontal: defaultPadding / 2),
                                      ),
                                      minimumSize: MaterialStateProperty.all(
                                          const Size(double.infinity, 70)),
                                      side: MaterialStateProperty.all(
                                          const BorderSide(
                                              color: Colors.white70, width: 2)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                    ),
                                    child: const Text(
                                      "Ubah Username",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  );
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      // if (anim.status == AnimationStatus.reverse) {
      //   tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      // } else {
      //   tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      // }

      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: anim, curve: Curves.easeInOut),
        ),
        // child: FadeTransition(
        //   opacity: anim,
        //   child: child,
        // ),
        child: child,
      );
    },
  );
}
