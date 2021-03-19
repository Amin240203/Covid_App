import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web extends StatelessWidget {
  final String title;
  Web({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new WebView(
        initialUrl: "https://kawalcovid19.id/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}