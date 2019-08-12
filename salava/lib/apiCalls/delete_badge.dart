import 'package:http/http.dart' as http;
import 'dart:convert';

deleteBadge(int id) async {
  final String url = 'http://192.168.1.26:5000/obpv1/badge/$id';

  print(url);

  var response = await http.delete(url);
  final data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    print("Ok");
  }
}
