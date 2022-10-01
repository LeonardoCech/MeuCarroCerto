import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Session {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<Map> post(dynamic data) async {
    http.Response response = await http.post(
      Uri.parse(
        'https://meucarrocerto.onlosant.com/login'),
        body: json.encode(data),
        headers: headers
      );
    updateCookie(response);
    return json.decode(response.body);
  }

  void updateCookie(http.Response response) {
    String? rawCookie = response.headers['authorization'];
    if (rawCookie != null && response.headers['authorization'] != null) {
      headers['token'] = response.headers['authorization']!;
    }
  }
}