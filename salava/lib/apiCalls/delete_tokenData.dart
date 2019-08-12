import 'package:http/http.dart' as http;
import 'package:salava/classes/tokenStorage.dart';

Future<bool> deleteTokenData() async {
  TokenStorage token = new TokenStorage();

  final file = await token.localFile;

  print('deleteTokenData starts...');

  String contents = await file.readAsString();

  List<String> tokens = contents.split(',');

  String accessToken = tokens[0];
  //String refreshToken = tokens[1];

  var url = 'http://192.168.1.26:5000/oauth/deletetokendata';

  var response = await http.get(url, headers: {'Authorization': accessToken});

  if (response.statusCode == 200) {
    print('Status code 200. Token data deleted from database.');

    token.overWriteFile();

    return true;
  } else {
    return false;
  }
}
