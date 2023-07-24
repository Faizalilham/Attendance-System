import 'package:get/get.dart';

import '../controllers/detections_controller.dart';

class DetectionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetectionsController>(
      () => DetectionsController(),
    );
  }
}
