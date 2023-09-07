import 'package:app_music/models/search_album/AlbumsModel.dart';
import 'package:flutter/material.dart';

import '../../widgets/album/tracksInAlbum.dart';

class DetailAlbumScreen extends StatefulWidget {
  Items? album;
  DetailAlbumScreen({required this.album, super.key});

  @override
  State<DetailAlbumScreen> createState() => _DetailAlbumScreenState();
}

class _DetailAlbumScreenState extends State<DetailAlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                color: Colors.white,
              ),
            ),
            Image.network(
              '${widget.album?.images?.first.url}',
              height: 250,
              width: 250,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${widget.album?.albumType}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${widget.album?.name}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${widget.album?.artists?.first.name}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: TracksInAlbum(urlApi: '${widget.album?.href}')),
          ],
        ),
      ),
    );
  }
}
