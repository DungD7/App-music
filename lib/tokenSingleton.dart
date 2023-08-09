import 'dart:convert';

import 'package:app_music/models/TokenModel.dart';
import 'package:http/http.dart' as http;

class TokenSingleton {
  static final TokenSingleton _singleton = TokenSingleton._internal();

  String token = '';
  final String contentType = "application/x-www-form-urlencoded";
  final String grantType = "client_credentials";
  final String clientID = '4235bc5a42284e6eae31fff9d2bd4399';
  final String clientSecret = '67504c5887ec4a9eacf0e32680f48270';

  factory TokenSingleton() {
    return _singleton;
  }

  TokenSingleton._internal() {
    _initializeToken();
  }

  Future<void> _initializeToken() async {
    getToken().then((data) {
      _singleton.token = data!;
      print('tokenn1: ${_singleton.token}');
    }).catchError((error) {
      print('Error fetching token: $error');
    });
  }

  Future<String?> getToken() async {
    final response = await http
        .post(Uri.parse('https://accounts.spotify.com/api/token'), headers: {
      "Content-Type": _singleton.contentType,
    }, body: {
      'grant_type': _singleton.grantType,
      'client_id': _singleton.clientID,
      'client_secret': _singleton.clientSecret
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String? tokenUrl;
      TokenModel tokenModel;
      tokenModel = TokenModel.fromJson(data);
      tokenUrl = tokenModel.accessToken;
      return tokenUrl;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
