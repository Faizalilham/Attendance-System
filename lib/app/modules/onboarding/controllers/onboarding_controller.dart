
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
 
  Future setKey() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("keys", true);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
