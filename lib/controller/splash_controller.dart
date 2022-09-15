import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/view/widgets/placeholder_splash_widget.dart';

class SplashController extends GetxController {
  late Rx<AnimationController> animationController;
  Widget placeholder = const SizedBox();
  void initAnimController(TickerProvider ticker) {
    animationController = (AnimationController(
            animationBehavior: AnimationBehavior.preserve,
            vsync: ticker,
            lowerBound: 0,
            upperBound: 2,
            value: 0,
            duration: const Duration(milliseconds: 5030))
          ..animateTo(1, curve: Curves.easeInCubic)
          ..addListener(() {
            if (animationController.value.isCompleted) {
              placeholder = const PlaceholderSplashWidget();
            }
            update();
          }))
        .obs;
  }
}
