import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Error on do something',
              style: TextStyle(fontSize: 20),
            ),
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.back_hand,
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
