import 'package:get/get.dart';

import '../controllers/students_controller.dart';

class StudentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentsController>(
      () => StudentsController(),
    );
  }
}
