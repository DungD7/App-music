import 'package:app_music/api/CallApiSpotify.dart';
import 'package:app_music/models/playlistsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'ItemPlaylist.dart';

class SuggestionList extends StatefulWidget {
  String urlPlaylist;
  SuggestionList({
    required this.urlPlaylist,
    super.key,
  });

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  PlaylistsModel? playlistsData;

  @override
  void initState() {
    CallApiSpotify.fetchApiPlaylists(widget.urlPlaylist).then((data) {
      setState(() {
        if (data != null) {
          playlistsData = data;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 170,
        child: (playlistsData == null)
            ? const Align(
                alignment: Alignment.center,
                child: SpinKitCircle(
                  color: Colors.green,
                  size: 50,
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 13,
                itemBuilder: (context, index) {
                  return ItemMusic(
                      items: playlistsData!.playlists!.items![index]);
                }),
      ),
    );
  }
}
