import 'package:app_music/models/search_album/AlbumsModel.dart';
import 'package:app_music/screens/album_screens/detail_album_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../api/CallApiSpotify.dart';

class ListAlbums extends StatefulWidget {
  String urlAlbums;
  ListAlbums({required this.urlAlbums, super.key});

  @override
  State<ListAlbums> createState() => _ListAlbumsState();
}

class _ListAlbumsState extends State<ListAlbums> {
  Items? album;
  AlbumsModel? albumsModel;

  @override
  void initState() {
    CallApiSpotify.fetchApiAlbum(widget.urlAlbums).then((data) {
      setState(() {
        if (data != null) {
          albumsModel = data;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (albumsModel == null)
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
                  itemCount: albumsModel?.albums?.items?.length,
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
                              '${albumsModel?.albums?.items?[index].images?.first.url}',
                              height: 150,
                              width: 150,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              '${albumsModel?.albums?.items?[index].name}',
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
                                  builder: (context) => DetailAlbumScreen(
                                        album:
                                            albumsModel?.albums?.items?[index],
                                      )));
                        },
                      ),
                    );
                  },
                ),
              ));
  }
}
