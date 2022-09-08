import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSettingsController extends GetxController {
  bool isFirstUse = true;
  bool isDarkTheme = true;
  @override
  bool get initialized {
    return super.initialized;
  }
}
