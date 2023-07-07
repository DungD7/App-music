import 'Artists.dart';
import 'Artist.dart';
import 'Album.dart';

class Song {
  Song({
      this.id, 
      this.name, 
      this.title, 
      this.code, 
      this.contentOwner, 
      this.isoffical, 
      this.isWorldWide, 
      this.playlistId, 
      this.artists, 
      this.artistsNames, 
      this.performer, 
      this.type, 
      this.link, 
      this.lyric, 
      this.thumbnail, 
      this.duration, 
      this.total, 
      this.rankNum, 
      this.rankStatus, 
      this.artist, 
      this.position, 
      this.order, 
      this.album,});

  Song.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    code = json['code'];
    contentOwner = json['content_owner'];
    isoffical = json['isoffical'];
    isWorldWide = json['isWorldWide'];
    playlistId = json['playlist_id'];
    if (json['artists'] != null) {
      artists = [];
      json['artists'].forEach((v) {
        artists?.add(Artists.fromJson(v));
      });
    }
    artistsNames = json['artists_names'];
    performer = json['performer'];
    type = json['type'];
    link = json['link'];
    lyric = json['lyric'];
    thumbnail = json['thumbnail'];
    duration = json['duration'];
    total = json['total'];
    rankNum = json['rank_num'];
    rankStatus = json['rank_status'];
    artist = json['artist'] != null ? Artist.fromJson(json['artist']) : null;
    position = json['position'];
    order = json['order'];
    album = json['album'] != null ? Album.fromJson(json['album']) : null;
  }
  String? id;
  String? name;
  String? title;
  String? code;
  int? contentOwner;
  bool? isoffical;
  bool? isWorldWide;
  String? playlistId;
  List<Artists>? artists;
  String? artistsNames;
  String? performer;
  String? type;
  String? link;
  String? lyric;
  String? thumbnail;
  int? duration;
  int? total;
  String? rankNum;
  String? rankStatus;
  Artist? artist;
  int? position;
  String? order;
  Album? album;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['title'] = title;
    map['code'] = code;
    map['content_owner'] = contentOwner;
    map['isoffical'] = isoffical;
    map['isWorldWide'] = isWorldWide;
    map['playlist_id'] = playlistId;
    if (artists != null) {
      map['artists'] = artists?.map((v) => v.toJson()).toList();
    }
    map['artists_names'] = artistsNames;
    map['performer'] = performer;
    map['type'] = type;
    map['link'] = link;
    map['lyric'] = lyric;
    map['thumbnail'] = thumbnail;
    map['duration'] = duration;
    map['total'] = total;
    map['rank_num'] = rankNum;
    map['rank_status'] = rankStatus;
    if (artist != null) {
      map['artist'] = artist?.toJson();
    }
    map['position'] = position;
    map['order'] = order;
    if (album != null) {
      map['album'] = album?.toJson();
    }
    return map;
  }

}