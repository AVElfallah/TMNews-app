import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

import '../repository/app_preferences.dart';

class AppSettingsController extends GetxController {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  PageController pageController = PageController();

  RxInt page = 0.obs;
  changeToEnglishLanguage() {
    Get.updateLocale(
      const Locale('en'),
    );
    FirebaseAuth.instance.setLanguageCode('en');
    SharedAppSettings().changeAppLanguage('en');
  }

  changeToArabicLanguage() {
    Get.updateLocale(const Locale('ar'));
    FirebaseAuth.instance.setLanguageCode('ar');
    SharedAppSettings().changeAppLanguage('ar');
  }

  changeTheme(bool val) {
    Get.changeThemeMode(
      val ? ThemeMode.dark : ThemeMode.light,
    );
    SharedAppSettings().changeThemeMode(val);
  }

  changePage(int newPage) {
    page.value = newPage;
  }

  goToPage(int newPage) {
    pageController.animateToPage(
      newPage,
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInExpo,
    );
  }

  open() {
    zoomDrawerController.open!();
    update();
  }
}
