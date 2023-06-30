import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  const NewsWebView({Key? key}) : super(key: key);

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  RxBool isLoading = true.obs;

  final data = Get.parameters;
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            isLoading.value = true;
          },
          onPageFinished: (url) {
            isLoading.value = false;
          },
          onProgress: (progress) {
            if (progress == 100) {
              isLoading.value = false;
            }
            isLoading.value = true;
          },
          onWebResourceError: (error) {
            Get.snackbar(
              'Error',
              error.description,
            );
          },
        ),
      )
      ..loadRequest(Uri.parse(data['webUrl']!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['title']!,
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
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
