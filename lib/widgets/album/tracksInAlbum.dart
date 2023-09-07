import 'package:app_music/api/CallApiSpotify.dart';
import 'package:app_music/models/search_album/tracksInAlbumModel.dart';
import 'package:app_music/screens/album_screens/playTracksInAlbum_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TracksInAlbum extends StatefulWidget {
  String urlApi;
  TracksInAlbum({required this.urlApi, super.key});

  @override
  State<TracksInAlbum> createState() => _TracksInAlbumState();
}

class _TracksInAlbumState extends State<TracksInAlbum> {
  TracksInAlbumModel? tracksInAlbumModel;
  int? position;
  List<Items> listTracks = [];
  Items? selectedTrack;

  @override
  void initState() {
    CallApiSpotify.fetchTracksInAlbum(widget.urlApi).then((data) {
      setState(() {
        tracksInAlbumModel = data;
        listTracks = tracksInAlbumModel!.tracks!.items!;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            child: (tracksInAlbumModel == null)
                ? const Align(
                    alignment: Alignment.center,
                    child: SpinKitCircle(
                      color: Colors.green,
                      size: 50,
                    ),
                  )
                : ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: tracksInAlbumModel?.tracks?.items?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          position = index;
                          setState(() {
                            selectedTrack =
                                tracksInAlbumModel?.tracks?.items?[index];
                          });
                        },
                        title: Text(
                          '${tracksInAlbumModel?.tracks?.items?[index].name}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        subtitle: Text(
                          '${tracksInAlbumModel?.tracks?.items?[index].artists?.first.name}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        leading: Text(
                          '${tracksInAlbumModel?.tracks?.items?[index].trackNumber}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Colors.green,
                            size: 25,
                          ),
                        ),
                      );
                    },
                  )),
        (selectedTrack == null)
            ? Container()
            : PlayTracksInAlbumScreen(
                positionTrack: position, listTracks: listTracks),
      ],
    );
  }
}
