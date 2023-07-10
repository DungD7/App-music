
class Music {
  List<Song>? _song;
  List<Null>? _customied;
  int? _peakScore;
  SongHis? _songHis;

  Music(
      {List<Song>? song,
        List<Null>? customied,
        int? peakScore,
        SongHis? songHis}) {
    if (song != null) {
      _song = song;
    }
    if (customied != null) {
      _customied = customied;
    }
    if (peakScore != null) {
      _peakScore = peakScore;
    }
    if (songHis != null) {
      _songHis = songHis;
    }
  }

  List<Song>? get song => _song;
  set song(List<Song>? song) => _song = song;
  List<Null>? get customied => _customied;
  set customied(List<Null>? customied) => _customied = customied;
  int? get peakScore => _peakScore;
  set peakScore(int? peakScore) => _peakScore = peakScore;
  SongHis? get songHis => _songHis;
  set songHis(SongHis? songHis) => _songHis = songHis;

  Music.fromJson(Map<String, dynamic> json) {
    if (json['song'] != null) {
      _song = <Song>[];
      json['song'].forEach((v) {
        _song!.add(Song.fromJson(v));
      });
    }
    if (json['customied'] != null) {
      _customied = <Null>[];
      json['customied'].forEach((v) {
      });
    }
    _peakScore = json['peak_score'];
    _songHis =
    json['songHis'] != null ? SongHis.fromJson(json['songHis']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_song != null) {
      data['song'] = _song!.map((v) => v.toJson()).toList();
    }
    if (_customied != null) {
    }
    data['peak_score'] = _peakScore;
    if (_songHis != null) {
      data['songHis'] = _songHis!.toJson();
    }
    return data;
  }
}

class Song {
  String? _id;
  String? _name;
  String? _title;
  String? _code;
  int? _contentOwner;
  bool? _isoffical;
  bool? _isWorldWide;
  String? _playlistId;
  List<Artists>? _artists;
  String? _artistsNames;
  String? _performer;
  String? _type;
  String? _link;
  String? _lyric;
  String? _thumbnail;
  int? _duration;
  int? _total;
  String? _rankNum;
  String? _rankStatus;
  Artist? _artist;
  int? _position;
  String? _order;
  Album? _album;
  String? _mvLink;

  Song(
      {String? id,
        String? name,
        String? title,
        String? code,
        int? contentOwner,
        bool? isoffical,
        bool? isWorldWide,
        String? playlistId,
        List<Artists>? artists,
        String? artistsNames,
        String? performer,
        String? type,
        String? link,
        String? lyric,
        String? thumbnail,
        int? duration,
        int? total,
        String? rankNum,
        String? rankStatus,
        Artist? artist,
        int? position,
        String? order,
        Album? album,
        String? mvLink}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (title != null) {
      _title = title;
    }
    if (code != null) {
      _code = code;
    }
    if (contentOwner != null) {
      _contentOwner = contentOwner;
    }
    if (isoffical != null) {
      _isoffical = isoffical;
    }
    if (isWorldWide != null) {
      _isWorldWide = isWorldWide;
    }
    if (playlistId != null) {
      _playlistId = playlistId;
    }
    if (artists != null) {
      _artists = artists;
    }
    if (artistsNames != null) {
      _artistsNames = artistsNames;
    }
    if (performer != null) {
      _performer = performer;
    }
    if (type != null) {
      _type = type;
    }
    if (link != null) {
      _link = link;
    }
    if (lyric != null) {
      _lyric = lyric;
    }
    if (thumbnail != null) {
      _thumbnail = thumbnail;
    }
    if (duration != null) {
      _duration = duration;
    }
    if (total != null) {
      _total = total;
    }
    if (rankNum != null) {
      _rankNum = rankNum;
    }
    if (rankStatus != null) {
      _rankStatus = rankStatus;
    }
    if (artist != null) {
      _artist = artist;
    }
    if (position != null) {
      _position = position;
    }
    if (order != null) {
      _order = order;
    }
    if (album != null) {
      _album = album;
    }
    if (mvLink != null) {
      _mvLink = mvLink;
    }
  }


  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get code => _code;
  set code(String? code) => _code = code;
  int? get contentOwner => _contentOwner;
  set contentOwner(int? contentOwner) => _contentOwner = contentOwner;
  bool? get isoffical => _isoffical;
  set isoffical(bool? isoffical) => _isoffical = isoffical;
  bool? get isWorldWide => _isWorldWide;
  set isWorldWide(bool? isWorldWide) => _isWorldWide = isWorldWide;
  String? get playlistId => _playlistId;
  set playlistId(String? playlistId) => _playlistId = playlistId;
  List<Artists>? get artists => _artists;
  set artists(List<Artists>? artists) => _artists = artists;
  String? get artistsNames => _artistsNames;
  set artistsNames(String? artistsNames) => _artistsNames = artistsNames;
  String? get performer => _performer;
  set performer(String? performer) => _performer = performer;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get link => _link;
  set link(String? link) => _link = link;
  String? get lyric => _lyric;
  set lyric(String? lyric) => _lyric = lyric;
  String? get thumbnail => _thumbnail;
  set thumbnail(String? thumbnail) => _thumbnail = thumbnail;
  int? get duration => _duration;
  set duration(int? duration) => _duration = duration;
  int? get total => _total;
  set total(int? total) => _total = total;
  String? get rankNum => _rankNum;
  set rankNum(String? rankNum) => _rankNum = rankNum;
  String? get rankStatus => _rankStatus;
  set rankStatus(String? rankStatus) => _rankStatus = rankStatus;
  Artist? get artist => _artist;
  set artist(Artist? artist) => _artist = artist;
  int? get position => _position;
  set position(int? position) => _position = position;
  String? get order => _order;
  set order(String? order) => _order = order;
  Album? get album => _album;
  set album(Album? album) => _album = album;
  String? get mvLink => _mvLink;
  set mvLink(String? mvLink) => _mvLink = mvLink;

  Song.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _title = json['title'];
    _code = json['code'];
    _contentOwner = json['content_owner'];
    _isoffical = json['isoffical'];
    _isWorldWide = json['isWorldWide'];
    _playlistId = json['playlist_id'];
    if (json['artists'] != null) {
      _artists = <Artists>[];
      json['artists'].forEach((v) {
        _artists!.add(Artists.fromJson(v));
      });
    }
    _artistsNames = json['artists_names'];
    _performer = json['performer'];
    _type = json['type'];
    _link = json['link'];
    _lyric = json['lyric'];
    _thumbnail = json['thumbnail'];
    _duration = json['duration'];
    _total = json['total'];
    _rankNum = json['rank_num'];
    _rankStatus = json['rank_status'];
    _artist =
    json['artist'] != null ? Artist.fromJson(json['artist']) : null;
    _position = json['position'];
    _order = json['order'];
    _album = json['album'] != null ? Album.fromJson(json['album']) : null;
    _mvLink = json['mv_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['title'] = _title;
    data['code'] = _code;
    data['content_owner'] = _contentOwner;
    data['isoffical'] = _isoffical;
    data['isWorldWide'] = _isWorldWide;
    data['playlist_id'] = _playlistId;
    if (_artists != null) {
      data['artists'] = _artists!.map((v) => v.toJson()).toList();
    }
    data['artists_names'] = _artistsNames;
    data['performer'] = _performer;
    data['type'] = _type;
    data['link'] = _link;
    data['lyric'] = _lyric;
    data['thumbnail'] = _thumbnail;
    data['duration'] = _duration;
    data['total'] = _total;
    data['rank_num'] = _rankNum;
    data['rank_status'] = _rankStatus;
    if (_artist != null) {
      data['artist'] = _artist!.toJson();
    }
    data['position'] = _position;
    data['order'] = _order;
    if (_album != null) {
      data['album'] = _album!.toJson();
    }
    data['mv_link'] = _mvLink;
    return data;
  }
}

class Artists {
  String? _name;
  String? _link;

  Artists({String? name, String? link}) {
    if (name != null) {
      _name = name;
    }
    if (link != null) {
      _link = link;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get link => _link;
  set link(String? link) => _link = link;

  Artists.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['link'] = _link;
    return data;
  }
}

class Artist {
  String? _id;
  String? _name;
  String? _link;
  String? _cover;
  String? _thumbnail;

  Artist(
      {String? id,
        String? name,
        String? link,
        String? cover,
        String? thumbnail}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (link != null) {
      _link = link;
    }
    if (cover != null) {
      _cover = cover;
    }
    if (thumbnail != null) {
      _thumbnail = thumbnail;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get link => _link;
  set link(String? link) => _link = link;
  String? get cover => _cover;
  set cover(String? cover) => _cover = cover;
  String? get thumbnail => _thumbnail;
  set thumbnail(String? thumbnail) => _thumbnail = thumbnail;

  Artist.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _link = json['link'];
    _cover = json['cover'];
    _thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['link'] = _link;
    data['cover'] = _cover;
    data['thumbnail'] = _thumbnail;
    return data;
  }
}

class Album {
  String? _id;
  String? _link;
  String? _title;
  String? _name;
  bool? _isoffical;
  String? _artistsNames;
  List<Artists>? _artists;
  String? _thumbnail;
  String? _thumbnailMedium;

  Album(
      {String? id,
        String? link,
        String? title,
        String? name,
        bool? isoffical,
        String? artistsNames,
        List<Artists>? artists,
        String? thumbnail,
        String? thumbnailMedium}) {
    if (id != null) {
      _id = id;
    }
    if (link != null) {
      _link = link;
    }
    if (title != null) {
      _title = title;
    }
    if (name != null) {
      _name = name;
    }
    if (isoffical != null) {
      _isoffical = isoffical;
    }
    if (artistsNames != null) {
      _artistsNames = artistsNames;
    }
    if (artists != null) {
      _artists = artists;
    }
    if (thumbnail != null) {
      _thumbnail = thumbnail;
    }
    if (thumbnailMedium != null) {
      _thumbnailMedium = thumbnailMedium;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get link => _link;
  set link(String? link) => _link = link;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get name => _name;
  set name(String? name) => _name = name;
  bool? get isoffical => _isoffical;
  set isoffical(bool? isoffical) => _isoffical = isoffical;
  String? get artistsNames => _artistsNames;
  set artistsNames(String? artistsNames) => _artistsNames = artistsNames;
  List<Artists>? get artists => _artists;
  set artists(List<Artists>? artists) => _artists = artists;
  String? get thumbnail => _thumbnail;
  set thumbnail(String? thumbnail) => _thumbnail = thumbnail;
  String? get thumbnailMedium => _thumbnailMedium;
  set thumbnailMedium(String? thumbnailMedium) =>
      _thumbnailMedium = thumbnailMedium;

  Album.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _link = json['link'];
    _title = json['title'];
    _name = json['name'];
    _isoffical = json['isoffical'];
    _artistsNames = json['artists_names'];
    if (json['artists'] != null) {
      _artists = <Artists>[];
      json['artists'].forEach((v) {
        _artists!.add(Artists.fromJson(v));
      });
    }
    _thumbnail = json['thumbnail'];
    _thumbnailMedium = json['thumbnail_medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['link'] = _link;
    data['title'] = _title;
    data['name'] = _name;
    data['isoffical'] = _isoffical;
    data['artists_names'] = _artistsNames;
    if (_artists != null) {
      data['artists'] = _artists!.map((v) => v.toJson()).toList();
    }
    data['thumbnail'] = _thumbnail;
    data['thumbnail_medium'] = _thumbnailMedium;
    return data;
  }
}

class SongHis {
  int? _minScore;
  double? _maxScore;
  int? _from;
  int? _interval;
  Data? _data;
  Score? _score;
  int? _totalScore;

  SongHis(
      {int? minScore,
        double? maxScore,
        int? from,
        int? interval,
        Data? data,
        Score? score,
        int? totalScore}) {
    if (minScore != null) {
      _minScore = minScore;
    }
    if (maxScore != null) {
      _maxScore = maxScore;
    }
    if (from != null) {
      _from = from;
    }
    if (interval != null) {
      _interval = interval;
    }
    if (data != null) {
      _data = data;
    }
    if (score != null) {
      _score = score;
    }
    if (totalScore != null) {
      _totalScore = totalScore;
    }
  }

  int? get minScore => _minScore;
  set minScore(int? minScore) => _minScore = minScore;
  double? get maxScore => _maxScore;
  set maxScore(double? maxScore) => _maxScore = maxScore;
  int? get from => _from;
  set from(int? from) => _from = from;
  int? get interval => _interval;
  set interval(int? interval) => _interval = interval;
  Data? get data => _data;
  set data(Data? data) => _data = data;
  Score? get score => _score;
  set score(Score? score) => _score = score;
  int? get totalScore => _totalScore;
  set totalScore(int? totalScore) => _totalScore = totalScore;


  SongHis.fromJson(Map<String, dynamic> json) {
    _minScore = json['min_score'];
    _maxScore = json['max_score'];
    _from = json['from'];
    _interval = json['interval'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _score = json['score'] != null ? Score.fromJson(json['score']) : null;
    _totalScore = json['total_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min_score'] = _minScore;
    data['max_score'] = _maxScore;
    data['from'] = _from;
    data['interval'] = _interval;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    if (_score != null) {
      data['score'] = _score!.toJson();
    }
    data['total_score'] = _totalScore;
    return data;
  }
}

class Data {
  List<DZ6CUFFZA>? _dz6CUFFZA;
  List<Z6CUFFZA>? _z6AABFU6;
  List<Z6CUFFZA>? _z6BADFAZ;

  Data(
      {List<Z6CUFFZA>? z6CUFFZA,
        List<Z6CUFFZA>? z6AABFU6,
        List<Z6CUFFZA>? z6BADFAZ}) {
    if (z6CUFFZA != null) {
      _dz6CUFFZA = dz6CUFFZA;
    }
    if (z6AABFU6 != null) {
      _z6AABFU6 = z6AABFU6;
    }
    if (z6BADFAZ != null) {
      _z6BADFAZ = z6BADFAZ;
    }
  }

  List<DZ6CUFFZA>? get dz6CUFFZA => _dz6CUFFZA;
  set dz6CUFFZA(List<DZ6CUFFZA>? z6CUFFZA) => _dz6CUFFZA = z6CUFFZA;
  List<Z6CUFFZA>? get z6AABFU6 => _z6AABFU6;
  set z6AABFU6(List<Z6CUFFZA>? z6AABFU6) => _z6AABFU6 = z6AABFU6;
  List<Z6CUFFZA>? get z6BADFAZ => _z6BADFAZ;
  set z6BADFAZ(List<Z6CUFFZA>? z6BADFAZ) => _z6BADFAZ = z6BADFAZ;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Z6CUFFZA'] != null) {
      _dz6CUFFZA = <DZ6CUFFZA>[];
      json['Z6CUFFZA'].forEach((v) {
        _dz6CUFFZA!.add(DZ6CUFFZA.fromJson(v));
      });
    }
    if (json['Z6AABFU6'] != null) {
      _z6AABFU6 = <Z6CUFFZA>[];
      json['Z6AABFU6'].forEach((v) {
        _z6AABFU6!.add(Z6CUFFZA.fromJson(v));
      });
    }
    if (json['Z6BADFAZ'] != null) {
      _z6BADFAZ = <Z6CUFFZA>[];
      json['Z6BADFAZ'].forEach((v) {
        _z6BADFAZ!.add(Z6CUFFZA.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_dz6CUFFZA != null) {
      data['Z6CUFFZA'] = _dz6CUFFZA!.map((v) => v.toJson()).toList();
    }
    if (_z6AABFU6 != null) {
      data['Z6AABFU6'] = _z6AABFU6!.map((v) => v.toJson()).toList();
    }
    if (_z6BADFAZ != null) {
      data['Z6BADFAZ'] = _z6BADFAZ!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Z6CUFFZA {
  int? _time;
  String? _hour;
  int? _counter;

  Z6CUFFZA({int? time, String? hour, int? counter}) {
    if (time != null) {
      _time = time;
    }
    if (hour != null) {
      _hour = hour;
    }
    if (counter != null) {
      _counter = counter;
    }
  }

  int? get time => _time;
  set time(int? time) => _time = time;
  String? get hour => _hour;
  set hour(String? hour) => _hour = hour;
  int? get counter => _counter;
  set counter(int? counter) => _counter = counter;

  Z6CUFFZA.fromJson(Map<String, dynamic> json) {
    _time = json['time'];
    _hour = json['hour'];
    _counter = json['counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = _time;
    data['hour'] = _hour;
    data['counter'] = _counter;
    return data;
  }
}

class Score {
  DZ6CUFFZA? _z6CUFFZA;
  DZ6CUFFZA? _z6AABFU6;
  DZ6CUFFZA? _z6BADFAZ;

  Score({DZ6CUFFZA? z6CUFFZA, DZ6CUFFZA? z6AABFU6, DZ6CUFFZA? z6BADFAZ}) {
    if (z6CUFFZA != null) {
      _z6CUFFZA = z6CUFFZA;
    }
    if (z6AABFU6 != null) {
      _z6AABFU6 = z6AABFU6;
    }
    if (z6BADFAZ != null) {
      _z6BADFAZ = z6BADFAZ;
    }
  }


  DZ6CUFFZA? get z6CUFFZA => _z6CUFFZA;
  set z6CUFFZA(DZ6CUFFZA? z6CUFFZA) => _z6CUFFZA = z6CUFFZA;
  DZ6CUFFZA? get z6AABFU6 => _z6AABFU6;
  set z6AABFU6(DZ6CUFFZA? z6AABFU6) => _z6AABFU6 = z6AABFU6;
  DZ6CUFFZA? get z6BADFAZ => _z6BADFAZ;
  set z6BADFAZ(DZ6CUFFZA? z6BADFAZ) => _z6BADFAZ = z6BADFAZ;

  Score.fromJson(Map<String, dynamic> json) {
    _z6CUFFZA = json['Z6CUFFZA'] != null
        ? DZ6CUFFZA.fromJson(json['Z6CUFFZA'])
        : null;
    _z6AABFU6 = json['Z6AABFU6'] != null
        ? DZ6CUFFZA.fromJson(json['Z6AABFU6'])
        : null;
    _z6BADFAZ = json['Z6BADFAZ'] != null
        ? DZ6CUFFZA.fromJson(json['Z6BADFAZ'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_z6CUFFZA != null) {
      data['Z6CUFFZA'] = _z6CUFFZA!.toJson();
    }
    if (_z6AABFU6 != null) {
      data['Z6AABFU6'] = _z6AABFU6!.toJson();
    }
    if (_z6BADFAZ != null) {
      data['Z6BADFAZ'] = _z6BADFAZ!.toJson();
    }
    return data;
  }
}

class DZ6CUFFZA {
  int? _totalScore;
  int? _totalPeakScore;
  int? _totalScoreRealtime;

  DZ6CUFFZA({int? totalScore, int? totalPeakScore, int? totalScoreRealtime}) {
    if (totalScore != null) {
      _totalScore = totalScore;
    }
    if (totalPeakScore != null) {
      _totalPeakScore = totalPeakScore;
    }
    if (totalScoreRealtime != null) {
      _totalScoreRealtime = totalScoreRealtime;
    }
  }

  int? get totalScore => _totalScore;
  set totalScore(int? totalScore) => _totalScore = totalScore;
  int? get totalPeakScore => _totalPeakScore;
  set totalPeakScore(int? totalPeakScore) => _totalPeakScore = totalPeakScore;
  int? get totalScoreRealtime => _totalScoreRealtime;
  set totalScoreRealtime(int? totalScoreRealtime) =>
      _totalScoreRealtime = totalScoreRealtime;

  DZ6CUFFZA.fromJson(Map<String, dynamic> json) {
    _totalScore = json['total_score'];
    _totalPeakScore = json['total_peak_score'];
    _totalScoreRealtime = json['total_score_realtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_score'] = _totalScore;
    data['total_peak_score'] = _totalPeakScore;
    data['total_score_realtime'] = _totalScoreRealtime;
    return data;
  }
}