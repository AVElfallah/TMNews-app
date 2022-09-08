import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tell_me_news/view/pages/login_singup_page.dart';
import 'package:unicons/unicons.dart';

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
              placeholder = Column(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Get.to(() => const UserLoginRegistrationPage(),
                          transition: Transition.circularReveal,
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.easeInOutCubicEmphasized);
                    },
                    icon: const Icon(UniconsLine.user),
                    label: const Text('Login | Sing up'),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(UniconsLine.globe),
                    label: const Text('Skip Login'),
                  )
                ],
              );
            }
            update();
          }))
        .obs;
  }
}
