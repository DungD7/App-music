import 'package:app_music/Screen/playlistScreen.dart';
import 'package:flutter/material.dart';

import '../Screen/PlayMusic.dart';
import '../model/playlistsModel.dart';


class ItemMusic extends StatelessWidget {
  Items items;
  ItemMusic({
    required this.items,
    super.key,
  });

  String txtName (String txtName) {
    String str ='';
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlaylistScreen(urlListSong: items.href!)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.zero
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                '${items.images?[0].url}',
              height: 120,
              width: 120,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 5,),
            Text(
              txtName((items.name).toString()),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),
            )
          ],
        ),
      ),
    );
  }
}