import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRegistrationController extends GetxController {
  RxString title = 'login'.obs;
  Rx<Color> loginButtonColor = Colors.blueGrey.shade900.obs;
  Rx<Color> singupButtonColor = Colors.grey.shade900.obs;

  PageController pageController = PageController();
  changePageTitle() {
    if (pageController.page == 0) {
      title.value = 'login';
    } else {
      title.value = 'singup';
    }
  }

  changePageColor() {
    if (page == 0) {
      loginButtonColor.value = Colors.blueGrey.shade900;
      singupButtonColor.value = Colors.grey.shade900;
    } else {
      singupButtonColor.value = Colors.blueGrey.shade900;
      loginButtonColor.value = Colors.grey.shade900;
    }
  }

  changePage(int pg) {
    pageController.animateTo(
      pg.toDouble(),
      duration: const Duration(milliseconds: 1300),
      curve: Curves.bounceInOut,
    );
    update();
  }

  double get page => pageController.page!;
}

class LoginWidgetController extends GetxController {}

class SingUpWidgetController extends GetxController {}
