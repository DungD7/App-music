import 'dart:convert';

import 'package:app_music/models/TokenModel.dart';
import 'package:app_music/models/search_album/AlbumsModel.dart'
    show AlbumsModel;
import 'package:app_music/tokenSingleton.dart';
import 'package:http/http.dart' as http;

import '../models/search_album/tracksInAlbumModel.dart';
import '../models/search_artist/ArtistsModel.dart' show ArtistsModel;
import '../models/search_playlist/PlaylistsModel.dart' show PlaylistsModel;
import '../models/search_playlist/SongInPlaylistModel.dart'
    show SongInPlaylistModel;
import '../models/search_show/ShowsModel.dart' show ShowsModel;
import '../models/search_track/TracksModel.dart' show TracksModel;
import '../screens/Search.dart';

class CallApiSpotify {
  static String urlPlaylists = "";
  static String urlToken = 'https://accounts.spotify.com/api/token';
  static PlaylistsModel? dataPlaylists;
  static SongInPlaylistModel? dataListSong;
  static AlbumsModel? dataAlbums;
  static ArtistsModel? dataArtists;
  static ShowsModel? dataShows;
  static TracksInAlbumModel? dataTracksInAlbum;
  static TracksModel? dataTracks;

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
      throw Exception('Failed to load data ');
    }
  }

  static Future<PlaylistsModel?> fetchApiPlaylists(String urlPlaylist) async {
    final response = await http.get(Uri.parse(urlPlaylist),
        headers: {'Authorization': 'Bearer ${TokenSingleton().token}'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      dataPlaylists = PlaylistsModel.fromJson(data);
      return dataPlaylists;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<SongInPlaylistModel?> fetchApiListSong(
      String urlListSong) async {
    final response = await http.get(Uri.parse(urlListSong),
        headers: {'Authorization': 'Bearer ${TokenSingleton().token}'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      dataListSong = SongInPlaylistModel.fromJson(data);
      return dataListSong;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<AlbumsModel?> fetchApiAlbum(String urlApi) async {
    final response = await http.get(Uri.parse(urlApi),
        headers: {'Authorization': 'Bearer ${TokenSingleton().token}'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      dataAlbums = AlbumsModel.fromJson(data);
      return dataAlbums;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<ArtistsModel?> fetchApiArtist(String urlApi) async {
    final response = await http.get(Uri.parse(urlApi),
        headers: {'Authorization': 'Bearer ${TokenSingleton().token}'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      dataArtists = ArtistsModel.fromJson(data);
      return dataArtists;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<TracksModel?> fetchApiTrack(String urlApi) async {
    final response = await http.get(Uri.parse(urlApi),
        headers: {'Authorization': 'Bearer ${TokenSingleton().token}'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      dataTracks = TracksModel.fromJson(data);
      return dataTracks;
    } else {
      throw Exception('Failed to load data ${query.value}');
    }
  }

  static Future<ShowsModel?> fetchApiShow(String urlApi) async {
    final response = await http.get(Uri.parse(urlApi),
        headers: {'Authorization': 'Bearer ${TokenSingleton().token}'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      dataShows = ShowsModel.fromJson(data);
      return dataShows;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<TracksInAlbumModel?> fetchTracksInAlbum(String urlApi) async {
    final response = await http.get(Uri.parse(urlApi),
        headers: {'Authorization': 'Bearer ${TokenSingleton().token}'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      dataTracksInAlbum = TracksInAlbumModel.fromJson(data);
      return dataTracksInAlbum;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
