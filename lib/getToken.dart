import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/TokenModel.dart';

class Token {
  static final Token _getToken = Token._internal();

  factory Token() {
    return _getToken;
  }

  Token._internal();

  static Future<String?> getToken() async {
    final response = await http.post(
        Uri.parse(
            "https://api.spotify.com/v1/search?q=Low%20G&type=playlist&market=VN"),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          'grant_type': 'client_credentials',
          'client_id': '4235bc5a42284e6eae31fff9d2bd4399',
          'client_secret': '67504c5887ec4a9eacf0e32680f48270'
        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String? tokenUrl;
      TokenModel tokenModel;
      tokenModel = TokenModel.fromJson(data);
      tokenUrl = tokenModel?.accessToken;
      return tokenUrl;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
