import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../api/CallApiSpotify.dart';
import '../model/ListSongModel.dart';
import '../model/playlistsModel.dart' show PlaylistsModel;
import 'PlayMusicScreen.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  PlaylistsModel? playlistsData;
  ItemSongs? selectedSong;
  List<ItemSongs> listSong = [];
  List<ItemSongs> displayList = [];
  void updateList(String value) {
    setState(() {
      displayList = listSong
          .where((element) => (element.track?.name?.toLowerCase())!
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    CallApiSpotify.fetchApiPlaylists().then((data) {
      if (data != null) {
        setState(() {
          playlistsData = data;
          addListSongs();
        });
      }
    });
    super.initState();
  }

  addListSongs() {
    int count = 0;
    for (int i = 0; i < playlistsData!.playlists!.items!.length; i++) {
      var urlListPlay = playlistsData!.playlists!.items![i].href;
      CallApiSpotify.fetchApiListSong(urlListPlay.toString()).then((data) {
        final listSongData = data;
        count++;
        if (listSongData != null) {
          for (int j = 0; j < listSongData.tracks!.items!.length; j++) {
            ItemSongs itemSong = listSongData.tracks!.items![j];
            listSong.add(itemSong);
          }
        }
        if (count == playlistsData!.playlists!.items!.length) {
          displayList = listSong;
          setState(() {});
        }
      });
    }
  }

  addMusicToLibrary() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 35, bottom: 5, left: 20),
                child: Text(
                  "Search for a music",
                  style: TextStyle(
                    fontSize: 27,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: TextField(
                  onChanged: (value) => updateList(value),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search_outlined),
                    prefixIconColor: Colors.white,
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: (displayList.isEmpty)
                      ? const SpinKitCircle(
                          color: Colors.green,
                          size: 50,
                        )
                      : ListView.builder(
                          itemCount: displayList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                selectedSong = displayList[index];
                                setState(() {});
                              },
                              title: Text(
                                '${displayList[index].track?.album?.name}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                              subtitle: Text(
                                '${displayList[index].track?.artists?[0].name}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  addMusicToLibrary();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 35,
                                ),
                              ),
                              leading: Image.network(
                                  '${displayList[index].track?.album?.images?[0].url}'),
                            );
                          }))
            ],
          ),
        ),
        (selectedSong == null)
            ? Container()
            : PlayMusicScreen(selectedSong: selectedSong)
      ],
    ));
  }
}
