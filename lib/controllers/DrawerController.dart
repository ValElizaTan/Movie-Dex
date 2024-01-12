import 'package:get/get.dart';

class DrawerController extends GetxController {
  var currentScreenIndex = 5.obs;

  void changeScreen(int index) {
    currentScreenIndex.value = index;
    Get.back();
  }
}
