import 'package:app_music/models/search_artist/ArtistsModel.dart';
import 'package:app_music/screens/detail_artist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../api/CallApiSpotify.dart';

class ListArtists extends StatefulWidget {
  String urlArtists;
  ListArtists({required this.urlArtists, super.key});

  @override
  State<ListArtists> createState() => _ListArtistsState();
}

class _ListArtistsState extends State<ListArtists> {
  ArtistsModel? artistsModel;

  @override
  void initState() {
    CallApiSpotify.fetchApiArtist(widget.urlArtists).then((data) {
      setState(() {
        if (data != null) {
          artistsModel = data;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (artistsModel == null)
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
                itemCount: artistsModel?.artists?.items?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailArtistScreen(
                                  artist: artistsModel?.artists?.items?[index],
                                ))),
                    title: Text(
                      '${artistsModel?.artists?.items?[index].name}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(
                      '${artistsModel?.artists?.items?[index].followers?.total} followers',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    leading: artistsModel
                                ?.artists?.items?[index].images?.isEmpty ==
                            true
                        ? const Icon(Icons.person_pin,
                            size: 50, color: Colors.white)
                        : Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      '${artistsModel?.artists?.items?[index].images?.first.url}')),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: Colors.redAccent,
                            ),
                          ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.navigate_next,
                        color: Colors.green,
                        size: 25,
                      ),
                    ),
                  );
                },
              ));
  }
}
