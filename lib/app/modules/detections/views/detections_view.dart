import 'package:attendance_system/app/modules/detections/controllers/detections_controller.dart';
import 'package:attendance_system/app/modules/detections/views/components/bottom_sheet.dart';
import 'package:attendance_system/app/modules/detections/views/components/camera_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DetectionsView extends GetView<DetectionsController> {
  DetectionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BottomSheetC(camera: CameraScreen(cameras!)));
  }
}
