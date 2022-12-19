import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/app_preferences.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();
  @override
  void onInit() {
    pageController.addListener(() {
      changePage(pageController.page!.toInt());
    });
    super.onInit();
  }

  RxInt page = 0.obs;
  void changeToEnglishLanguage() {
    Get.updateLocale(
      const Locale('en'),
    );
    FirebaseAuth.instance.setLanguageCode('en');
    SharedAppSettings.instance.changeAppLanguage('en');
  }

  void changeToArabicLanguage() {
    Get.updateLocale(const Locale('ar'));
    FirebaseAuth.instance.setLanguageCode('ar');
    SharedAppSettings.instance.changeAppLanguage('ar');
  }

  void changeTheme(bool val) {
    Get.changeThemeMode(
      val ? ThemeMode.dark : ThemeMode.light,
    );
    SharedAppSettings.instance.changeThemeMode(val);
  }

  void changePage(int newPage) {
    page.value = newPage;
  }

  void goToPage(int newPage) {
    pageController.animateToPage(
      newPage,
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInExpo,
    );
  }
}
