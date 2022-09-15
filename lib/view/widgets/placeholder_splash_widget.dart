import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceholderSplashWidget extends StatelessWidget {
  const PlaceholderSplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          onPressed: () {
            Get.toNamed('login_reg');
          },
          icon: const Icon(Icons.person),
          label: const Text('Login | Sing up'),
        ),
        TextButton.icon(
          onPressed: () {
            Get.offAndToNamed('/homepage');
          },
          icon: const Icon(Icons.public),
          label: const Text('Skip Login'),
        )
      ],
    );
  }
}
