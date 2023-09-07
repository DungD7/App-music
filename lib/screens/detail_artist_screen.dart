import 'package:app_music/models/search_artist/ArtistsModel.dart';
import 'package:flutter/material.dart';

class DetailArtistScreen extends StatefulWidget {
  Items? artist;
  DetailArtistScreen({required this.artist, super.key});

  @override
  State<DetailArtistScreen> createState() => _DetailArtistScreenState();
}

class _DetailArtistScreenState extends State<DetailArtistScreen> {
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
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${widget.artist?.images?.first.url}')),
                borderRadius: const BorderRadius.all(Radius.circular(250)),
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  '${widget.artist?.type}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            Text(
              '${widget.artist?.name}',
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            const SizedBox(height: 10),
            Text(
              '${widget.artist?.followers?.total} Followers',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Genres:  ${widget.artist?.genres}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
