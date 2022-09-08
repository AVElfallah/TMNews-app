import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/view/widgets/login_widget.dart';
import 'package:tell_me_news/view/widgets/singup_widget.dart';

class LoginRegistrationController extends GetxController {
  RxString title = 'login'.obs;

  Widget bodyWidget = const LoginWidget();

  void changeBodyWidget() {
    if (title.value == 'login') {
      title.value = 'singup';
      bodyWidget = const SingupWidget();
      update();
    } else {
      title.value = 'login';
      bodyWidget = const LoginWidget();
      update();
    }
  }
}

class LoginWidgetController extends GetxController {}

class SingUpWidgetController extends GetxController {}
