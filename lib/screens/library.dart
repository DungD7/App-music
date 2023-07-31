import 'package:app_music/api/CallApiSpotify.dart';
import 'package:app_music/models/playlistsModel.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  bool? isChecked = false;
  PlaylistsModel? playLists;
  @override
  void initState() {
    CallApiSpotify.fetchApiPlaylists().then((data) {
      setState(() {
        playLists = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green),
                    child: const Center(child: Text("D")),
                  ),
                  Text(
                    '${playLists?.playlists?.items?.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 27),
                  ),
                ],
              ),
              Checkbox(
                onChanged: (newBool) {
                  setState(() {
                    isChecked = newBool;
                  });
                },
                value: isChecked,
                //checkColor: Colors.white,
                activeColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
