import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class AppSettingsController extends GetxController {
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  PageController pageController = PageController();

  RxInt page = 0.obs;
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
