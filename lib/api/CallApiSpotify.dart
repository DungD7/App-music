import 'dart:convert';

import 'package:app_music/model/TokenModel.dart';
import 'package:http/http.dart' as http;

import '../model/ListSongModel.dart';
import '../model/playlistsModel.dart';

class CallApiSpotify {
  static String urlPlaylists =
      "https://api.spotify.com/v1/search?q=Low%20G&type=playlist&market=VN";
  static String urlToken = 'https://accounts.spotify.com/api/token';
  static String token =
      'BQBzh6IcDR3X2OEc0p2M5YUa7AptI4NwCMzY81QEQlfC71HvKWZzz6-PcDG4U9nPEdKbdWFExr6UDNtIkiMFtq2LnhwZywj1AK3ClodFciCCWAdlK6k';
  static PlaylistsModel? dataPlaylists;
  static ListSongModel? dataListSong;

  static Future<PlaylistsModel?> fetchApiPlaylists() async {
    final response = await http.get(Uri.parse(urlPlaylists),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      dataPlaylists = PlaylistsModel.fromJson(data);
      return dataPlaylists;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<ListSongModel?> fetchApiListSong(String urlListSong) async {
    //token = getToken().toString();
    final response = await http.get(Uri.parse(urlListSong),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      dataListSong = ListSongModel.fromJson(data);
      //print ('listData: ${dataListSong?.tracks?.items?[0].track?.previewUrl}');
      return dataListSong;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<String?> getToken() async {
    final response = await http.post(Uri.parse(urlToken), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    }, body: {
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
