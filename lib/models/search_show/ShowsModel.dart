class ShowsModel {
  Shows? shows;

  ShowsModel({this.shows});

  ShowsModel.fromJson(Map<String, dynamic> json) {
    shows = json['shows'] != null ? Shows.fromJson(json['shows']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shows != null) {
      data['shows'] = shows!.toJson();
    }
    return data;
  }
}

class Shows {
  String? href;
  List<Items>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  Shows(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  Shows.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = limit;
    data['next'] = next;
    data['offset'] = offset;
    data['previous'] = previous;
    data['total'] = total;
    return data;
  }
}

class Items {
  List<String>? availableMarkets;
  List<String>? copyrights;
  String? description;
  bool? explicit;
  ExternalUrls? externalUrls;
  String? href;
  String? htmlDescription;
  String? id;
  List<Images>? images;
  bool? isExternallyHosted;
  List<String>? languages;
  String? mediaType;
  String? name;
  String? publisher;
  int? totalEpisodes;
  String? type;
  String? uri;

  Items(
      {this.availableMarkets,
      this.copyrights,
      this.description,
      this.explicit,
      this.externalUrls,
      this.href,
      this.htmlDescription,
      this.id,
      this.images,
      this.isExternallyHosted,
      this.languages,
      this.mediaType,
      this.name,
      this.publisher,
      this.totalEpisodes,
      this.type,
      this.uri});

  Items.fromJson(Map<String, dynamic> json) {
    availableMarkets = json['available_markets'];
    description = json['description'];
    explicit = json['explicit'];
    externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    htmlDescription = json['html_description'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    isExternallyHosted = json['is_externally_hosted'];
    languages = json['languages'].cast<String>();
    mediaType = json['media_type'];
    name = json['name'];
    publisher = json['publisher'];
    totalEpisodes = json['total_episodes'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available_markets'] = availableMarkets;
    data['description'] = description;
    data['explicit'] = explicit;
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    data['href'] = href;
    data['html_description'] = htmlDescription;
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['is_externally_hosted'] = isExternallyHosted;
    data['languages'] = languages;
    data['media_type'] = mediaType;
    data['name'] = name;
    data['publisher'] = publisher;
    data['total_episodes'] = totalEpisodes;
    data['type'] = type;
    data['uri'] = uri;
    return data;
  }
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spotify'] = spotify;
    return data;
  }
}

class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

  Images.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}
