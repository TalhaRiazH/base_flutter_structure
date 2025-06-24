import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splashCountDown();
  }

  splashCountDown() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.offNamed(AppRoutes.NameHere);
    });
  }
}
