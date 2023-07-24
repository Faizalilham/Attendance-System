import 'package:get/get.dart';

import '../controllers/student_today_controller.dart';

class StudentTodayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentTodayController>(
      () => StudentTodayController(),
    );
  }
}
