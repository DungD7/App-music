class Artists {
  Artists({
      this.name, 
      this.link,});

  Artists.fromJson(dynamic json) {
    name = json['name'];
    link = json['link'];
  }
  String? name;
  String? link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['link'] = link;
    return map;
  }

}