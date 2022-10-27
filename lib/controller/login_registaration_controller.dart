import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../config/app_route.dart';

class LoginRegistrationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      changePageTitle();
      changePageColor();
    });
  }

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

  goToSingupPage() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 1300),
      curve: Curves.bounceInOut,
    );
  }

  goToLoginPage() {
    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 1300),
      curve: Curves.bounceInOut,
    );
  }

  double get page => pageController.page!;
}

class LoginWidgetController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var passowordTXTCtrl = TextEditingController();
  var userTXTCtrl = TextEditingController();

  String? userValidator(String? user) {
    if (user == null || user.isEmpty) {
      return 'enter your user name';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'enter your password';
    }
    return null;
  }

  login() {
    if (formKey.currentState!.validate()) {
      Get.showOverlay(
        asyncFunction: () async {
          var loginBack = await _loginUser(
            userTXTCtrl.text,
            passowordTXTCtrl.text,
          );
          var user = await FirebaseAuth.instance.userChanges().first;
          if (loginBack) {
            if (user!.emailVerified) {
              Get.offAllNamed(
                Routes.homePage,
              );
              return loginBack;
            } else {
              Get.offAllNamed(
                Routes.emailActivisonPage,
              );
              return loginBack;
            }
          } else {
            return false;
          }
        },
        loadingWidget: const GFLoader(
          size: GFSize.LARGE,
          type: GFLoaderType.square,
        ),
      );
      // return false;
    }
  }

  Future<bool> _loginUser(String email, String password) async {
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var passowordTXTCtrl = TextEditingController();
  var userTXTCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  String? usernameValidator(String? username) {
    if (username == null || username.isEmpty) {
      return 'enter your user name';
    }
    return null;
  }

  String? confirmationValidator(String? confirmation) {
    if (confirmation != passowordTXTCtrl.text) {
      return 'password is not matching';
    }
    if (passowordTXTCtrl.text == '') {
      return 'empty field not allowed';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'enter your user name';
    } else if (password.length < 6) {
      return 'password must be at least 6 letters';
    }

    return null;
  }

  String? emailValidator(String? email) {
    if (!email!.contains('@gmail.com') && !email.contains('@yahoo.com')) {
      return 'not supported email';
    }

    return null;
  }

  createUser() async {
    Get.showOverlay(
      asyncFunction: () async {
        if (formKey.currentState!.validate()) {
          var back = await _createNewUser(
            userTXTCtrl.text,
            emailCtrl.text,
            passowordTXTCtrl.text,
          );
          if (back) {
            Get.offAllNamed(Routes.emailActivisonPage);
          }
        }
      },
      loadingWidget: const GFLoader(
        size: GFSize.LARGE,
        type: GFLoaderType.square,
      ),
    );
  }

  Future<bool> _createNewUser(
      String userName, String email, String password) async {
    try {
      UserCredential userCredential = await (FirebaseAuth.instance
            ..setLanguageCode(Get.locale!.countryCode))
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
