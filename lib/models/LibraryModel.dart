import 'ListSongModel.dart';

class LibraryModel {
  List<NewPlaylist> library;
  LibraryModel({required this.library});
}

class NewPlaylist {
  List<ItemSongs> playlistYourLib;
  String name = 'new playlist';
  bool isChecked = false;
  NewPlaylist({required this.playlistYourLib, required this.name});
}
