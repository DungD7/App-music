import 'package:app_music/api/CallApiSpotify.dart';
import 'package:app_music/models/LibraryModel.dart';
import 'package:app_music/models/ListSongModel.dart';
import 'package:app_music/screens/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'PlayMusicScreen.dart';

class PlaylistScreen extends StatefulWidget {
  String urlListSong;
  PlaylistScreen({required this.urlListSong, super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ListSongModel? listSongData;
  ItemSongs? selectedSong;
  List<ItemSongs> listSong = [];
  int? position;
  @override
  void initState() {
    CallApiSpotify.fetchApiListSong(widget.urlListSong).then((data) {
      setState(() {
        listSongData = data;
        listSong = listSongData!.tracks!.items!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: (listSongData == null)
                  ? const Align(
                      alignment: Alignment.center,
                      child: SpinKitCircle(
                        color: Colors.green,
                        size: 50,
                      ),
                    )
                  : infPlaylist(),
            ),
            (selectedSong == null)
                ? Container()
                : PlayMusicScreen(
                    //selectedSong: selectedSong,
                    positionSong: position,
                    listSong: listSong),
          ],
        ),
      ),
    );
  }

  Expanded infPlaylist() {
    return Expanded(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
            ),
          ),
          Image.network(
            '${listSongData?.images?.first.url}',
            height: 250,
            width: 250,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Playlist',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Text(
            '${listSongData?.name}',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white, fontSize: 40),
          ),
          const SizedBox(height: 10),
          Text(
            '${listSongData?.owner?.displayName} • ${listSongData?.followers?.total} likes • ${listSongData?.tracks?.items?.length} songs',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          showPlaylist(),
        ],
      ),
    );
  }

  Widget showPlaylist() {
    return Expanded(
        child: ListView.builder(
      itemCount: listSongData?.tracks?.items?.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            position = index;
            selectedSong = listSongData?.tracks?.items?[index];
            setState(() {});
          },
          title: Text(
            '${listSongData?.tracks?.items?[index].track?.album?.name}',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          subtitle: Text(
            '${listSongData?.tracks?.items?[index].track?.artists?.first.name}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
          leading: Image.network(
            '${listSongData?.tracks?.items?[index].track?.album?.images?.first.url}',
            height: 50,
            width: 50,
          ),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Dialog.fullscreen(
                          backgroundColor: Colors.black.withOpacity(0.8),
                          child: Column(
                            children: [
                              const SizedBox(height: 80),
                              Container(
                                color: Colors.grey.shade900,
                                child: Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setIsChecked();
                                          Navigator.pop(context);
                                        },
                                        child: const Text('cancel',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300))),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.17),
                                    const Text(
                                      "Add to playlist",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () {
                                  String name = 'New playlist';
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext dialogContext) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: const Text(
                                          'Give your playlist a name',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        content: TextField(
                                          onChanged: (value) {
                                            name = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: name,
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Center(
                                            child: TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.green)),
                                              child: const Text(
                                                'Create',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              onPressed: () {
                                                List<ItemSongs> list = [];
                                                list.add(listSongData!
                                                    .tracks!.items![index]);
                                                NewPlaylist newPlaylist =
                                                    NewPlaylist(
                                                        name: name,
                                                        playlistYourLib: list);
                                                yourLib.value.library
                                                    .add(newPlaylist);
                                                Navigator.pop(dialogContext);
                                                Navigator.pop(
                                                    context); // Dismiss alert dialog
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Text(
                                    "New playlist",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: yourLib.value.library.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                        yourLib.value.library[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      subtitle: yourLib.value.library[index]
                                              .playlistYourLib.isEmpty
                                          ? Text(
                                              '${yourLib.value.library[index].playlistYourLib.length} track',
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 14,
                                              ),
                                            )
                                          : Text(
                                              '${yourLib.value.library[index].playlistYourLib.length} tracks',
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 14,
                                              ),
                                            ),
                                      leading: yourLib.value.library[index]
                                              .playlistYourLib.isEmpty
                                          ? Image.asset(
                                              'assets/image_playlist.jpg',
                                              height: 50,
                                              width: 50,
                                            )
                                          : Image.network(
                                              '${yourLib.value.library[index].playlistYourLib.first.track?.album?.images?.first.url}',
                                              height: 50,
                                              width: 50,
                                            ),
                                      trailing: Checkbox(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        onChanged: (newBool) {
                                          setState(() {
                                            yourLib.value.library[index]
                                                .isChecked = newBool!;
                                          });
                                        },
                                        value: yourLib
                                            .value.library[index].isChecked,
                                        checkColor: Colors.white,
                                        activeColor: Colors.green,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () {
                                  addMusicToLib(index);
                                  setIsChecked();
                                  Navigator.pop(context);
                                },
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ));
                    },
                  );
                },
              );
            },
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.green,
              size: 25,
            ),
          ),
        );
      },
    ));
  }

  void setIsChecked() {
    for (int i = 0; i < yourLib.value.library.length; i++) {
      yourLib.value.library[i].isChecked = false;
    }
  }

  void addMusicToLib(int index) {
    for (int i = 0; i < yourLib.value.library.length; i++) {
      if (yourLib.value.library[i].isChecked == true) {
        bool checkMusic = false;
        for (int j = 0;
            j < yourLib.value.library[i].playlistYourLib.length;
            j++) {
          if (listSong[index] == yourLib.value.library[i].playlistYourLib[j]) {
            checkMusic = true;
          }
        }
        if (checkMusic == false) {
          yourLib.value.library[i].playlistYourLib.add(listSong[index]);
        }
      }
    }
  }
}
