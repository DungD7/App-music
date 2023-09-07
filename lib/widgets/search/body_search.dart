import 'package:app_music/widgets/album/list_albums.dart';
import 'package:app_music/widgets/list_artists.dart';
import 'package:app_music/widgets/list_playlists.dart';
import 'package:app_music/widgets/list_tracks.dart';
import 'package:flutter/material.dart';

ValueNotifier<String> query = ValueNotifier<String>('');

class BodySearch extends StatefulWidget {
  const BodySearch({super.key});

  @override
  State<BodySearch> createState() => _BodySearchState();
}

class _BodySearchState extends State<BodySearch> {
  int currentIndex = 0;
  List<Widget> body = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void updateBodyScreens(String query) {
    body = [
      Container(),
      ListTracks(
          urlTracks:
              'https://api.spotify.com/v1/search?q=$query&type=track&market=vn&offset=0&limit=50'),
      ListPlaylists(
          urlPlaylists:
              'https://api.spotify.com/v1/search?q=$query&type=playlist&market=vn&offset=0&limit=50'),
      ListArtists(
          urlArtists:
              'https://api.spotify.com/v1/search?q=$query&type=artist&market=vn&offset=0&limit=50'),
      ListAlbums(
          urlAlbums:
              'https://api.spotify.com/v1/search?q=$query&type=album&market=vn&offset=0&limit=50'),
    ];
  }

  Color bgColor = Colors.grey.shade800;
  Color txtColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(bgColor)),
                    child: Text(
                      'Track',
                      style: TextStyle(
                        color: txtColor,
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentIndex = 1;
                        updateBodyScreens(query.value);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(bgColor)),
                    child: Text(
                      'Playlist',
                      style: TextStyle(
                        color: txtColor,
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentIndex = 2;
                        updateBodyScreens(query.value);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(bgColor)),
                    child: Text(
                      'Artist',
                      style: TextStyle(
                        color: txtColor,
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentIndex = 3;
                        updateBodyScreens(query.value);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(bgColor)),
                    child: Text(
                      'Album',
                      style: TextStyle(
                        color: txtColor,
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentIndex = 4;
                        updateBodyScreens(query.value);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(child: body[currentIndex]),
      ],
    );
  }
}
