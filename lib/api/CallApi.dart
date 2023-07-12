import 'dart:convert';
import 'package:app_music/model/SongModel.dart';
import 'package:http/http.dart' as http;

class CallApi {
  static String url = "http://mp3.zing.vn/xhr/chart-realtime?songId=0&videoId=0&albumId=0&chart=song&time=-1";
  static SongModel? listData;

  static Future<SongModel?> fetchApi() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Map<String, dynamic> songModelMap = data['data'];
      listData = SongModel.fromJson(songModelMap);
      return listData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
