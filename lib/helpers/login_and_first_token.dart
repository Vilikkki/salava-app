import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salava/classes/tokenStorage.dart';
import 'package:salava/classes/token.dart';

Future<bool> loginAndGetToken(String email, String password) async {
  if (email.isEmpty || password.isEmpty || !email.contains('@')) {
    return false;
  } else {
    var data = {
      'grant_type': 'password',
      'client_id': 'OBP_Mobile',
      'username': email,
      'password': password
    };

    var url = 'http://192.168.1.26:5000/oauth/token';

    var response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      if (response.body.contains('error')) {
        print('Error response');
        return false;
      }

      final items = json.decode(response.body);

      print('Contents of status code 200: ${response.body}');

      Token tokeni = Token.fromJson(items);

      TokenStorage store = new TokenStorage();

      print(
          'The following sequence of characters will be written to the file.\nOrder: type and access, then refresh: ${tokeni.accessAndRefreshWithType()}');

      store.writeAccessAndRefreshToFile(tokeni.accessAndRefreshWithType());
    } else if (response.statusCode == 404) {
      print('Status code 404');

      return false;
    }
  }
  return true;
}
