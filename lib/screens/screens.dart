import 'package:app_music/models/search_playlist/SongInPlaylistModel.dart';
import 'package:app_music/screens/Home.dart';
import 'package:app_music/screens/Search.dart';
import 'package:app_music/screens/library.dart';
import 'package:app_music/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ValueNotifier<bool> isCurrentPlaying = ValueNotifier(false);
ValueNotifier<int?> positionCurrentPlaying = ValueNotifier(null);
ValueNotifier<List<ItemSongs>> currentPlaylist = ValueNotifier([]);

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentIndex = 0;
  List<Widget> screens = [
    const Home(),
    const Search(),
    const Library(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          screens[currentIndex],
          // isCurrentPlaying.value == false
          //     ? Container()
          //     : PlayMusicScreen(
          //         positionSong: positionCurrentPlaying.value,
          //         listSong: currentPlaylist.value)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white70,
        onTap: (index) => setState(() {
          currentIndex = index;
          query.value = '';
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search_circle),
            activeIcon: Icon(CupertinoIcons.search_circle_fill),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_music_outlined),
            activeIcon: Icon(Icons.my_library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_crop_square),
            activeIcon: Icon(CupertinoIcons.person_crop_square_fill),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
