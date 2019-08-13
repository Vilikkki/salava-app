import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salava/classes/badge.dart';
import 'package:salava/classes/tokenStorage.dart';
import 'package:salava/classes/token.dart';

Future<List<Badge>> fetchBadges() async {
  TokenStorage token = new TokenStorage();

  final file = await token.localFile;

  print('fetchBadges starts...');

  String contents = await file.readAsString();

  if (contents.isNotEmpty) {
    List<String> tokens = contents.split(',');

    String accessToken = tokens[0];
    String refreshToken = tokens[1];

    var url = 'http://192.168.1.26:5000/oauth/badges';

    var response = await http.get(url, headers: {'Authorization': accessToken});

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Badge> badgeList = items.map<Badge>((json) {
        return Badge.fromJson(json);
      }).toList();

      return badgeList;
    } else if (response.statusCode == 401) {
      final items = json.decode(response.body);
      print(items);

      var data = {'grant_type': 'refresh_token', 'refresh_token': refreshToken};
      var url = 'http://192.168.1.26:5000/oauth/token';

      var postResponse = await http.post(url, body: data);
      if (postResponse.statusCode == 200) {
        final items = json.decode(postResponse.body);

        Token tokeni = Token.fromJson(items);

        TokenStorage store = new TokenStorage();

        store.writeAccessAndRefreshToFile(tokeni.accessAndRefreshWithType());

        String newContents = await file.readAsString();
        List<String> newToken = newContents.split(',');

        String newAccessToken = newToken[0];

        var url = 'http://192.168.1.26:5000/oauth/badges';

        var lastResponse =
            await http.get(url, headers: {'Authorization': newAccessToken});

        final newItems =
            json.decode(lastResponse.body).cast<Map<String, dynamic>>();

        List<Badge> newBadgeList = newItems.map<Badge>((json) {
          return Badge.fromJson(json);
        }).toList();

        return newBadgeList;
      }
    }
  }
  return null;
}
