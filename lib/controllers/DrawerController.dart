import 'package:get/get.dart';

class DrawerController extends GetxController {
  var currentScreenIndex = 2.obs;

  void changeScreen(int index) {
    currentScreenIndex.value = index;
    Get.back();
  }
}
