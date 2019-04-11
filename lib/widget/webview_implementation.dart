import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewImplementation extends StatefulWidget {
  final String title;

  WebviewImplementation(this.title);

  @override
  State<StatefulWidget> createState() {
    return new _WebviewImplementationState();
  }

}

class _WebviewImplementationState extends State<WebviewImplementation>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
      ),
      body: new WebView(
        initialUrl: 'https://github.com/MrinalKantiGhosh2196/cafeteria_tw',
      ),
    );
  }
}