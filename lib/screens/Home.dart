import 'package:app_music/models/search_playlist/PlaylistsModel.dart';
import 'package:app_music/screens/playlist_screens/detail_playlist_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/SuggestionList.dart';

ValueNotifier<List<Items>> recentlyPlayed = ValueNotifier([]);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TimeOfDay currentTime = TimeOfDay.now();

  String? greeting;

  getGreeting() {
    if (currentTime.hour.toInt() >= 5 && currentTime.hour.toInt() < 12) {
      greeting = 'Good morning';
    } else if (currentTime.hour.toInt() >= 12 &&
        currentTime.hour.toInt() < 18) {
      greeting = 'Good afternoon';
    } else {
      greeting = 'Good evening';
    }
  }

  setListRecentlyPlayed() {
    while (recentlyPlayed.value.length > 6) {
      recentlyPlayed.value.remove(recentlyPlayed.value.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    getGreeting();
    setListRecentlyPlayed();
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    '$greeting',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              namePlaylists('Recently played'),
              recentlyPlayed.value.isEmpty ? Container() : showRecentlyPlayed(),
              namePlaylists('Fresh new music'),
              SuggestionList(
                  urlPlaylist:
                      "https://api.spotify.com/v1/search?q=Fresh%2520new%2520music&type=playlist"),
              const SizedBox(
                height: 10,
              ),
              namePlaylists('Trending'),
              SuggestionList(
                  urlPlaylist:
                      "https://api.spotify.com/v1/search?q=trending%2520viet%2520nam&type=playlist&market=vn"),
              const SizedBox(
                height: 10,
              ),
              namePlaylists("Today's biggest hit"),
              SuggestionList(
                  urlPlaylist:
                      "https://api.spotify.com/v1/search?q=today%27s%2520biggest%2520hit&type=playlist"),
              const SizedBox(
                height: 10,
              ),
              namePlaylists("Episodes for you"),
              SuggestionList(
                  urlPlaylist:
                      "https://api.spotify.com/v1/search?q=Episodes%20for%20you&type=playlist"),
              const SizedBox(
                height: 60,
              ),
              //const SuggestionList(),
            ],
          ),
        ),
      ),
    );
  }

  Padding showRecentlyPlayed() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recentlyPlayed.value.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.45,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: ShapeDecoration(
                color: Colors.grey.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPlaylistScreen(
                            urlListSong: recentlyPlayed.value[index].href!)));
                setState(() {});
              },
              title: Text(
                overflow: TextOverflow.ellipsis,
                '${recentlyPlayed.value[index].name}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              leading: Image.network(
                '${recentlyPlayed.value[index].images?.first.url}',
              ),
            ),
          );
        },
      ),
    );
  }

  Align namePlaylists(String name) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
