import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../api/CallApiSpotify.dart';
import '../models/search_playlist/PlaylistsModel.dart';
import '../screens/playlist_screens/detail_playlist_screen.dart';

class ListPlaylists extends StatefulWidget {
  String urlPlaylists;
  ListPlaylists({required this.urlPlaylists, super.key});

  @override
  State<ListPlaylists> createState() => _ListPlaylistsState();
}

class _ListPlaylistsState extends State<ListPlaylists> {
  PlaylistsModel? playlistsData;

  @override
  void initState() {
    CallApiSpotify.fetchApiPlaylists(widget.urlPlaylists).then((data) {
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
    return Container(
        child: (playlistsData == null)
            ? const Align(
                alignment: Alignment.center,
                child: SpinKitCircle(
                  color: Colors.green,
                  size: 50,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  shrinkWrap: true,
                  itemCount: playlistsData?.playlists?.items?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // childAspectRatio: 3.45,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: ShapeDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: InkWell(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Image.network(
                              '${playlistsData?.playlists?.items?[index].images?.first.url}',
                              height: 150,
                              width: 150,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              '${playlistsData?.playlists?.items?[index].name}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPlaylistScreen(
                                      urlListSong: playlistsData!
                                          .playlists!.items![index].href!)));
                        },
                      ),
                    );
                  },
                ),
              ));
  }
}
