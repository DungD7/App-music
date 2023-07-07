import 'Song.dart';

class SongModelEntity {
  SongModelEntity({
      this.song,});

  SongModelEntity.fromJson(dynamic json) {
    if (json['song'] != null) {
      song = [];
      json['song'].forEach((v) {
        song?.add(Song.fromJson(v));
      });
    }
  }
  List<Song>? song;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (song != null) {
      map['song'] = song?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}