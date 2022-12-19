import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/app_user.dart';
import '../repository/app_preferences.dart';

class AppSettingsService extends GetxService {
  @override
  void onInit() {
    shared.getAppUserAccount().then((value) {
      userPreferences = value;
      Get.changeThemeMode(
          userPreferences!.isDarkMode! ? ThemeMode.dark : ThemeMode.dark);
      return true;
    });

    super.onInit();
  }

  final shared = SharedAppSettings.instance;

  AppUserPreferences? userPreferences;
}
