import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRegistrationController extends GetxController {
  RxString title = 'login'.tr.obs;
  Rx<Color> loginButtonColor =
      Get.isDarkMode ? Colors.blueGrey.shade900.obs : Colors.blue.shade200.obs;
  Rx<Color> singupButtonColor =
      Get.isDarkMode ? Colors.grey.shade900.obs : Colors.grey.shade400.obs;
  Color get _primeColor =>
      Get.isDarkMode ? Colors.blueGrey.shade900 : Colors.blue.shade200;
  Color get _secondColor =>
      Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade400;

  PageController pageController = PageController();

  SingUpWidgetController singupController =
      Get.put<SingUpWidgetController>(SingUpWidgetController());

  LoginWidgetController loginController =
      Get.put<LoginWidgetController>(LoginWidgetController());

  @override
  onClose() {}
  changePageTitle() {
    if (pageController.page == 0) {
      title.value = 'login'.tr;
    } else {
      title.value = 'singup'.tr;
    }
  }

  changePageColor() {
    if (page == 0) {
      loginButtonColor.value = _primeColor;
      singupButtonColor.value = _secondColor;
    } else {
      singupButtonColor.value = _primeColor;
      loginButtonColor.value = _secondColor;
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

class LoginWidgetController extends GetxController {
  Future<bool> loginUser(String email, String password) async {
    try {
      var back = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // ignore: unnecessary_null_comparison
      return back != null ? true : false;
    } on FirebaseAuthException catch (exp) {
      Get.snackbar(
        'error'.tr,
        exp.message!,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        barBlur: 40,
      );
      return false;
    } catch (exp) {
      Get.snackbar(
        'error'.tr,
        exp.toString(),
        backgroundColor: Colors.red,
        barBlur: 30,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}

class SingUpWidgetController extends GetxController {
  Future<bool> createNewUser(
      String userName, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.sendEmailVerification();
      await userCredential.user!.updateDisplayName(userName);
      return true;
    } on FirebaseAuthException catch (exp) {
      Get.snackbar(
        'error'.tr,
        exp.message!,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        barBlur: 40,
      );
      return false;
    } catch (exp) {
      Get.snackbar(
        'error'.tr,
        exp.toString(),
        backgroundColor: Colors.red,
        barBlur: 30,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
