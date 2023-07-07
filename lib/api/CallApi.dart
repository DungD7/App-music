import 'dart:convert';

import 'package:app_music/model/SongModel.dart';
import 'package:http/http.dart' as http;

import '../model/SongModelEntity.dart';

class CallApi {
  static String url = "http://mp3.zing.vn/xhr/chart-realtime?songId=0&videoId=0&albumId=0&chart=song&time=-1";
  static List<Song> listData = [];

  static Future<List<Song>> fetchApi() async {
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        listData.add(Song.fromJson(index));
      }
      return listData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}