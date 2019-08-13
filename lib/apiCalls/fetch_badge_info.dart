import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salava/classes/badgeInfo.dart';

Future<BadgeInfo> fetchBadgeInfo(int id) async {
  print('fetchBadgeInfo starts...');
  var url = 'http://192.168.1.26:5000/obpv1/badge/info/$id';

  var response = await http.get(url);
  try {
    if (response.statusCode == 200) {
      BadgeInfo badgeInfo = BadgeInfo.fromJson(json.decode(response.body));

      return badgeInfo;
    } else {
      return null;
    }
  } on Exception catch (e) {
    print(e);
  }
  return null;
}
