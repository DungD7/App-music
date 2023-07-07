import 'Artists.dart';

class Album {
  Album({
      this.id, 
      this.link, 
      this.title, 
      this.name, 
      this.isoffical, 
      this.artistsNames, 
      this.artists, 
      this.thumbnail, 
      this.thumbnailMedium,});

  Album.fromJson(dynamic json) {
    id = json['id'];
    link = json['link'];
    title = json['title'];
    name = json['name'];
    isoffical = json['isoffical'];
    artistsNames = json['artists_names'];
    if (json['artists'] != null) {
      artists = [];
      json['artists'].forEach((v) {
        artists?.add(Artists.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'];
    thumbnailMedium = json['thumbnail_medium'];
  }
  String? id;
  String? link;
  String? title;
  String? name;
  bool? isoffical;
  String? artistsNames;
  List<Artists>? artists;
  String? thumbnail;
  String? thumbnailMedium;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['link'] = link;
    map['title'] = title;
    map['name'] = name;
    map['isoffical'] = isoffical;
    map['artists_names'] = artistsNames;
    if (artists != null) {
      map['artists'] = artists?.map((v) => v.toJson()).toList();
    }
    map['thumbnail'] = thumbnail;
    map['thumbnail_medium'] = thumbnailMedium;
    return map;
  }

}