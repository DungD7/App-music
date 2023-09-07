import 'search_playlist/SongInPlaylistModel.dart';

class LibraryModel {
  List<NewPlaylist> library;
  LibraryModel({required this.library});

  factory LibraryModel.fromJson(Map<String, dynamic> json) {
    var libraryData = json['library'] as List<dynamic>?;
    List<NewPlaylist> library = [];
    if (libraryData != null) {
      library = libraryData.map((v) => NewPlaylist.fromJson(v)).toList();
    }
    return LibraryModel(library: library);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['library'] = library.map((v) => v.toJson()).toList();
    return data;
  }
}

class NewPlaylist {
  List<ItemSongs> playlistYourLib;
  String name;
  bool isChecked;

  NewPlaylist(
      {required this.playlistYourLib,
      this.name = 'new playlist',
      this.isChecked = false});

  factory NewPlaylist.fromJson(Map<String, dynamic> json) {
    var name = json['name'] ?? 'new playlist';
    var playlistYourLibData = json['playlistYourLib'] as List<dynamic>?;

    List<ItemSongs> playlistYourLib = [];
    if (playlistYourLibData != null) {
      playlistYourLib =
          playlistYourLibData.map((v) => ItemSongs.fromJson(v)).toList();
    }
    return NewPlaylist(name: name, playlistYourLib: playlistYourLib);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['playlistYourLib'] = playlistYourLib.map((v) => v.toJson()).toList();
    data['name'] = name;
    data['isChecked'] = isChecked;
    return data;
  }
}
