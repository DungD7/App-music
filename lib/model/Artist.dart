class Artist {
  Artist({
      this.id, 
      this.name, 
      this.link, 
      this.cover, 
      this.thumbnail,});

  Artist.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    cover = json['cover'];
    thumbnail = json['thumbnail'];
  }
  String? id;
  String? name;
  String? link;
  String? cover;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['link'] = link;
    map['cover'] = cover;
    map['thumbnail'] = thumbnail;
    return map;
  }

}