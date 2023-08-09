import 'dart:convert';

import 'package:app_music/models/TokenModel.dart';
import 'package:app_music/tokenSingleton.dart';
import 'package:http/http.dart' as http;

import '../models/ListSongModel.dart';
import '../models/playlistsModel.dart';

class CallApiSpotify {
  static String urlPlaylists = "";
  static String urlToken = 'https://accounts.spotify.com/api/token';
  static String token =
      'BQCGD625p89giH9IaZqavUrC2KcG8gcUGVUWdPh4b4qTrMtQ3linGcTqBRtVx9xAJEXVbvcwdHLsRoZFg0u62tpsYbNQd-wGFH62Z7lrfCs2J6mW-i4';
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
      "Content-Type": TokenSingleton().contentType,
    }, body: {
      'grant_type': TokenSingleton().grantType,
      'client_id': TokenSingleton().clientID,
      'client_secret': TokenSingleton().clientSecret
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
