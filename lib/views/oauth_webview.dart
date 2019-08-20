import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:salava/helpers/oauth.dart';

class OauthTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FloatingActionButton(
              child: Text('PAINA'),
              onPressed: () async {
                oauthFlow();
              }),
        ),
      ),
    );
  }
}

class OauthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: WebView(
        initialUrl: 'http://192.168.1.26:5000/user/oauth2/authorize',
        // initialUrl: 'https://openbadgepassport.com/app/user/login/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
