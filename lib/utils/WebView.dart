import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  String url,name;
  WebViewScreen({Key key, @required this.url,@required this.name}) : super(key: key);


  @override
  _WebViewScreen createState() => _WebViewScreen(url,name);
}

class _WebViewScreen extends State<WebViewScreen> {

  String url="",name="";
  _WebViewScreen(this.url,this.name);

  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text(name),
        ),
      body: WebView(
        initialUrl: url,
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        },
      ),
    );
  }

}
