import 'package:get/get.dart';

class UserController extends GetxController {
  var firstName = ''.obs;
  var lastName = ''.obs;

  void updateFirstName(String newName) {
    firstName.value = newName;
  }

  void updateLastName(String newLastName) {
    lastName.value = newLastName;
  }
}
