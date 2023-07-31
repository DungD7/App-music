import 'ListSongModel.dart';

class Library {
  List<NewPlaylist> library;
  Library({required this.library});
}

class NewPlaylist {
  List<ItemSongs> playlistYourLib;
  String name = 'new playlist';
  bool isChecked = false;
  NewPlaylist({required this.playlistYourLib, required this.name});
}
