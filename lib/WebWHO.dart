import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebWHO extends StatelessWidget {
  final String title;
  WebWHO({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new WebView(
        initialUrl: "https://www.who.int/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}