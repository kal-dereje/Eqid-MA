import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxString token = ''.obs;
  RxString username = ''.obs;
  RxString email = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    // Perform any initialization tasks here
    token.value = await SessionManager().get('token');
    username.value = await SessionManager().get('username');
    email.value = await SessionManager().get('email');
  }

  void setToken(String value) {
    token.value = value;
  }

  void setUsername(String value) {
    username.value = value;
  }

  void setEmail(String value) {
    email.value = value;
  }
}
