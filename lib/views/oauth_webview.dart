import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:salava/helpers/oauth.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class OauthTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FloatingActionButton(
              child: Text('PAINA'),
              onPressed: () async {
                /*String htmlString =*/ await initialAuthReq();
                /*print(htmlString);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OauthView(
                            //  uri: htmlString,
                            )));*/
              }),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////
class OauthView extends StatefulWidget {
  //const OauthView({Key key, this.uri}) : super(key: key);

  //final String uri;

  @override
  _OauthViewState createState() => _OauthViewState();
}

class _OauthViewState extends State<OauthView> {
  Map<String, String> queryParams;
  var uri;

  @override
  initState() {
    super.initState();
    queryParams = initialOauthQueryParams();
    uri = Uri.http('192.168.1.26:5000', '/user/oauth2/authorize', queryParams);
    print(uri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: uri.toString(),
      appBar: new AppBar(
        title: new Text("Widget webview"),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////
/*const String examplePage = '''
<!DOCTYPE html><html>
<head><title>Salava oauth start page</title></head>
<body>
<p>
Click Button to start authentication
</p>
</body>
</html>
''';*/

/*String _loadHTML() {
  return r'''
      <html>
        <body onload="document.f.submit();">
          <form id="f" name="f" method="post" action="YOUR_POST_URL">
            <input type="hidden" name="PARAMETER" value="VALUE" />
          </form>
        </body>
      </html>
    ''';
}*/

/*WebView(
        initialUrl:
            new Uri.dataFromString(_uri, mimeType: 'text/html').toString(),
        //initialUrl: 'https://openbadgepassport.com/app/user/login/',
        javascriptMode: JavascriptMode.unrestricted,
      ), */

/*new WebviewScaffold(
      url:
          'https://openbadgepassport.com/app/user/login/', //new Uri.dataFromString(_uri, mimeType: 'text/html').toString(),
      appBar: new AppBar(
        title: new Text("Widget webview"),
      ),
    ); */

/*Scaffold(
      appBar: AppBar(
        title: Text('Auth WebView'),
      ),
      body: WebView(
        initialUrl: new Uri.dataFromString(examplePage, mimeType: 'text/html')
            .toString(),
        //initialUrl: 'https://openbadgepassport.com/app/user/login/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await initialAuthReq();
        },
        child: Text('Begin'),
      ),
    ); */
