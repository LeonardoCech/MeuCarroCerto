import 'dart:convert';

import 'package:http/http.dart' as http;

class Session {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  dynamic post(dynamic data) async {
    http.Response response = await http.post(
        Uri.parse('https://meucarrocerto.onlosant.com/login'),
        body: json.encode(data),
        headers: headers);
    String token = json.decode(response.body)["token"];
    updateCookie(token);
    return json.decode(response.body);
  }

  void updateCookie(String token) {
    headers['Authorization'] = "Bearer $token";
  }
}
