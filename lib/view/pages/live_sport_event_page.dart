import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveSportsEventsPage extends StatefulWidget {
  const LiveSportsEventsPage({Key? key}) : super(key: key);

  @override
  State<LiveSportsEventsPage> createState() => _LiveSportsEventsPageState();
}

class _LiveSportsEventsPageState extends State<LiveSportsEventsPage> {
  late WebViewController _controller;

  _loadHtmlFromAssets() async {
    String fileText =
        await rootBundle.loadString('assets/html/live_score.html');
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('live'),
      ),
      /*   body: WebView(
        initialUrl: 'help',
        zoomEnabled: true,
        gestureNavigationEnabled: true,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: ((controller) {
          _controller = controller;
          _loadHtmlFromAssets();
        }),
      ), */
    );
  }
}
