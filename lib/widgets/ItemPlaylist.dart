import 'package:app_music/screens/Home.dart';
import 'package:app_music/screens/playlist_screens/detail_playlist_screen.dart';
import 'package:flutter/material.dart';

import '../models/search_playlist/PlaylistsModel.dart';

class ItemPlaylist extends StatelessWidget {
  Items items;
  ItemPlaylist({
    required this.items,
    super.key,
  });

  String txtName(String txtName) {
    String str = '';
    if (txtName.length > 15) {
      str = '${txtName.substring(0, 14)}...';
    } else {
      str = txtName;
    }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        for (int i = 0; i < recentlyPlayed.value.length; i++) {
          if (recentlyPlayed.value[i].name == items.name) {
            recentlyPlayed.value.remove(recentlyPlayed.value[i]);
          }
        }
        recentlyPlayed.value.add(items);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPlaylistScreen(urlListSong: items.href!)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(borderRadius: BorderRadius.zero),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              '${items.images?.first.url}',
              height: 120,
              width: 120,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              txtName((items.name).toString()),
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
