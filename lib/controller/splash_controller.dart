import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late AnimationController animationController;
  bool isAnmatedDone = false;
  void initAnimController(TickerProvider ticker) {
    animationController = (AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: ticker,
      lowerBound: 0,
      upperBound: 2,
      value: 0,
      duration: const Duration(
        milliseconds: 5030,
      ),
    )
      ..animateTo(
        1,
        curve: Curves.easeInCubic,
      )
      ..addListener(
        () {
          if (animationController.isCompleted) {
            isAnmatedDone = true;
          }
          update();
        },
      ));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
