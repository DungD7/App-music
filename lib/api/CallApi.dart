import 'dart:convert';

import 'package:app_music/model/SongModel.dart';
import 'package:app_music/model2/SongModel2.dart';
import 'package:http/http.dart' as http;

class CallApi {
  static String url = "http://mp3.zing.vn/xhr/chart-realtime?songId=0&videoId=0&albumId=0&chart=song&time=-1";
  static SongModel? listData;

  static Future<SongModel?> fetchApi() async {
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      /*for (Map<String, dynamic> index in data) {
        if (index == 2) {
          listData = (SongModel.fromJson(index));
        }
        }*/
      Map<String, dynamic> songModelMap = data['data'];
      //Map<String, List<dynamic>> songMap = songModelMap['song'];
      listData = SongModel.fromJson(data);
      int? x = listData?.song?.length;
      print("gia tri x = $x");
      return listData;
    } else {
      throw Exception('Failed to load data');
    }
  }

}
