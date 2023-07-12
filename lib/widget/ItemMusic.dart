import 'package:app_music/model/SongModel.dart';
import 'package:flutter/material.dart';

import '../Screen/PlayMusic.dart';


class ItemMusic extends StatelessWidget {
  Song song;
  ItemMusic({
    required this.song,
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
            context, MaterialPageRoute(builder: (context) => PlayMusic(songSelected: song)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.zero
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('${song.thumbnail}'),
            const SizedBox(height: 5,),
            Text(
              txtName((song.name).toString()),
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