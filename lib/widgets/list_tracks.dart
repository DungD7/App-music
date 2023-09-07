import 'package:app_music/screens/track_screen/playTrackScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../api/CallApiSpotify.dart';
import '../models/search_track/TracksModel.dart' show TracksModel, Items;

class ListTracks extends StatefulWidget {
  String urlTracks;
  ListTracks({required this.urlTracks, super.key});

  @override
  State<ListTracks> createState() => _ListTracksState();
}

class _ListTracksState extends State<ListTracks> {
  TracksModel? tracksModel;
  int? position;
  List<Items> listTracks = [];
  Items? selectedTrack;

  @override
  void initState() {
    _trackInit();
    super.initState();
  }

  _trackInit() async {
    CallApiSpotify.fetchApiTrack(widget.urlTracks).then((data) {
      setState(() {
        tracksModel = data;
        listTracks = tracksModel!.tracks!.items!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            child: (tracksModel == null)
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
                    itemCount: tracksModel?.tracks?.items?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          position = index;
                          setState(() {
                            selectedTrack = tracksModel?.tracks?.items?[index];
                          });
                        },
                        title: Text(
                          '${tracksModel?.tracks?.items?[index].name}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        subtitle: Text(
                          '${tracksModel?.tracks?.items?[index].artists?.first.name}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        leading: Image.network(
                          '${tracksModel?.tracks?.items?[index].album?.images?.first.url}',
                          height: 50,
                          width: 50,
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
            : PlayTrackScreen(positionTrack: position, listTracks: listTracks),
      ],
    );
  }
}
