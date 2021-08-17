import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: camel_case_types
class event_page extends StatefulWidget {
  final String info;
  const event_page({Key? key, required this.info}) : super(key: key);

  @override
  _event_pageState createState() => _event_pageState();
}

// ignore: camel_case_types
class _event_pageState extends State<event_page> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new WebView(
        initialUrl:
            "https://playvalorant.com/id-id/news/game-updates/valorant-patch-notes-3-02/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
