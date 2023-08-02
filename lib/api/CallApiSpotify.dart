import 'dart:convert';

import 'package:app_music/models/TokenModel.dart';
import 'package:http/http.dart' as http;

import '../models/ListSongModel.dart';
import '../models/playlistsModel.dart';

class CallApiSpotify {
  static String urlPlaylists = "";
  static String urlToken = 'https://accounts.spotify.com/api/token';
  static String token =
      'BQBwUPaKKNfwD3sZlVNNytzPe8q-J4mwZ1sC4_GPSQOAx2AC3Gvu0JbfDTo3HeHtTWtG-1LI8rTPY1kiYD2k6iV6_Gwwx_V5Qvsy8ZcX-YnRHZQwoYM';
  static PlaylistsModel? dataPlaylists;
  static ListSongModel? dataListSong;

  static Future<PlaylistsModel?> fetchApiPlaylists(String urlPlaylist) async {
    final response = await http.get(Uri.parse(urlPlaylist),
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
    final response = await http.get(Uri.parse(urlListSong),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      dataListSong = ListSongModel.fromJson(data);
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
      tokenUrl = tokenModel.accessToken;
      return tokenUrl;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
