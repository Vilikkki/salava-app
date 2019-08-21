import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Map<String, String> initialOauthQueryParams() {
  var uuid = new Uuid();
  String randomUuid = uuid.v4().replaceAll('-', '');

  String codeVerifier = randomUuid;
  List<int> bytes = utf8.encode(codeVerifier);

  var sha256Digest = sha256.convert(bytes);

  var codeChallenge = base64.encode(sha256Digest.bytes);

  print('Code verifier: ' + codeVerifier);
  //print('Code verifier as byteList: -> $bytes');
  print('Sha256 digested codeverifier byteList AKA code challenge: -> ' +
      codeChallenge);

  String responseType = 'code';
  String clientID = 'oauth-client-app-id';
  String redirectUri = 'salava://salava.com';
  String codeChallengeMethod = 'S256';
  String state = 'abc';

  Map<String, String> queryParams = {
    'response_type': responseType,
    'client_id': clientID,
    'redirect_uri': redirectUri,
    'state': state,
    'code_challenge': codeChallenge,
    'code_challenge_method': codeChallengeMethod
  };

  return queryParams;
}

Future initialAuthReq() async {
  Map<String, String> queryParams = initialOauthQueryParams();

  var uri =
      Uri.http('192.168.1.26:5000', '/user/oauth2/authorize', queryParams);

  var response = await http.get(uri);
  if (response.statusCode == 200) {
    print('OK:ta tullee');
  }

  String uriAsString = uri.toString();

  print(uriAsString);

  if (await canLaunch(uriAsString)) {
    await launch(uriAsString,
        forceSafariVC: true, forceWebView: true, enableJavaScript: true);
  } else {
    print('Failed to launch url...');
  }
}
