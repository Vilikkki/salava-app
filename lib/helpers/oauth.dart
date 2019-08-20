import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

oauthFlow() async {
  var uuid = new Uuid();
  String randomUuid = uuid.v4().replaceAll('-', '');

  String codeVerifier = randomUuid;
  List<int> bytes = utf8.encode(codeVerifier);

  var sha256Digest = sha256.convert(bytes);

  var codeChallenge = base64.encode(sha256Digest.bytes);

  print('Code verifier: ' + codeVerifier);
  //print('Code verifier as byteList: -> $bytes');
  print('Sha256 digested codeverifier byteList: -> ' + codeChallenge);

  String clientID = 'oauth-client-app-id';

  var data = {
    'response_type': 'code',
    'client_id': '',
    'redirect_uri': '',
    'state': '',
    'code_challenge': '',
    'code_challenge_method': ''
  };
}
