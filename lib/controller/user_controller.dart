import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repository/app_preferences.dart';

import '../model/app_user.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    debugPrint('int');
    _shared.getAppUserAccount().then((value) {
      userPreferences = value;
      update();
      return true;
    });
    super.onInit();
  }

  final _shared = SharedAppSettings();

  AppUserPreferences? userPreferences;
}
