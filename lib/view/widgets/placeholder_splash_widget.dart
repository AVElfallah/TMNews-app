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
          label: Text(
            'Login | Sing up',
            style: TextStyle(
              color: context.theme.secondaryHeaderColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            Get.offAndToNamed('/homepage');
          },
          icon: const Icon(Icons.public),
          label: Text(
            'Skip Login',
            style: TextStyle(
              color: context.theme.secondaryHeaderColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
