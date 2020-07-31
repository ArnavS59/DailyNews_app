import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  //const ArticlePage({Key key}) : super(key: key);

  final String blogurl;
  ArticlePage({this.blogurl});

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("Daily"),
          Text(
            "News",
            //textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue[500],
            ),
          ),
        ]),
        elevation: 5,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogurl,
          onWebViewCreated: (controller) {
            _completer.complete(controller);
          },
        ),
      ),
    );
  }
}
