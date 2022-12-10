import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatelessWidget {
  const NewsWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool isLoading = true.obs;

    final data = Get.parameters;
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['title']!,
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: data['webUrl'],
            onPageFinished: ((url) {
              isLoading.value = false;
            }),
            backgroundColor: context.theme.primaryColor,
            navigationDelegate: (n) => NavigationDecision.prevent,
            onWebResourceError: ((error) {
              Get.snackbar(
                'Error',
                error.description,
              );
            }),
          ),
          Obx(
            () => Visibility(
              visible: isLoading.value,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.indigo,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
