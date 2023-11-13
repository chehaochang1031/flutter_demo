import 'package:get/get.dart';

enum GenderType { male, female, other }

class LoginController extends GetxController {
  var readStatus = false.obs;
  Rx<GenderType> genderType = GenderType.male.obs;
}
