import 'package:app_music/models/LibraryModel.dart';
import 'package:app_music/models/ListSongModel.dart';
import 'package:app_music/screens/PlayMusicScreen.dart';
import 'package:flutter/material.dart';

import 'Search.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  ItemSongs? selectedSong;
  int? position;
  List<NewPlaylist> displayYourLib = yourLib.value.library;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green),
                  child: const Center(child: Text("D")),
                ),
                const Text(
                  'Your library',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(width: 90),
                IconButton(
                    onPressed: () {
                      String name = 'New playlist';
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: const Text(
                              'Give your playlist a name',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
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
                                    NewPlaylist newPlaylist = NewPlaylist(
                                        name: name, playlistYourLib: list);
                                    yourLib.value.library.add(newPlaylist);
                                    Navigator.pop(dialogContext);
                                    setState(() {}); // Dismiss alert dialog
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.white,
                    ))
              ],
            ),
            search(),
            ValueListenableBuilder(
                valueListenable: yourLib,
                builder: (BuildContext context, Library, Widget? child) =>
                    showYourLib()),
          ],
        ),
      ),
    );
  }

  Expanded showYourLib() {
    return Expanded(
      child: ListView.builder(
        itemCount: displayYourLib.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  selectedSong = null;
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Dialog.fullscreen(
                        backgroundColor: Colors.black.withOpacity(0.8),
                        child: showYourPlaylist(context, index, setState),
                      );
                    },
                  );
                },
              );
            },
            title: Text(
              displayYourLib[index].name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            subtitle: displayYourLib[index].playlistYourLib.length <= 1
                ? Text(
                    '${displayYourLib[index].playlistYourLib.length} track',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  )
                : Text(
                    '${displayYourLib[index].playlistYourLib.length} tracks',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
            leading: displayYourLib[index].playlistYourLib.isEmpty
                ? Image.asset(
                    'assets/image_playlist.jpg',
                    height: 50,
                    width: 50,
                  )
                : Image.network(
                    '${displayYourLib[index].playlistYourLib.first.track?.album?.images?.first.url}',
                    height: 50,
                    width: 50,
                  ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text(
                        'Are you sure want to remove this playlist?',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      actions: [
                        TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            yourLib.value.library
                                .remove(yourLib.value.library[index]);
                            Navigator.pop(context);
                            setState(() {});
                          },
                        ),
                        TextButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  const BorderSide(color: Colors.green))),
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.remove_circle_outline,
                color: Colors.green,
                size: 22,
              ),
            ),
          );
        },
      ),
    );
  }

  SafeArea showYourPlaylist(
      BuildContext context, int index, StateSetter setState) {
    if (yourLib.value.library[index].playlistYourLib.isEmpty) {
      Navigator.pop(context);
      initState();
    }
    return SafeArea(
      child: yourLib.value.library[index].playlistYourLib.isEmpty
          ? Container()
          : Stack(
              children: [
                Expanded(
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
                        '${displayYourLib[index].playlistYourLib.first.track?.album?.images?.first.url}',
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
                        displayYourLib[index].name,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                          child: ListView.builder(
                        itemCount:
                            yourLib.value.library[index].playlistYourLib.length,
                        itemBuilder: (context, value) {
                          return ListTile(
                            onTap: () {
                              position = value;
                              selectedSong = yourLib
                                  .value.library[index].playlistYourLib[value];
                              setState(() {});
                            },
                            trailing: IconButton(
                              onPressed: () {
                                yourLib.value.library[index].playlistYourLib
                                    .remove(yourLib.value.library[index]
                                        .playlistYourLib[value]);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                color: Colors.green,
                                size: 22,
                              ),
                            ),
                            title: Text(
                              '${yourLib.value.library[index].playlistYourLib[value].track?.album?.name}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Text(
                              '${yourLib.value.library[index].playlistYourLib[value].track?.artists?.first.name}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            leading: Image.network(
                              '${yourLib.value.library[index].playlistYourLib[value].track?.album?.images?.first.url}',
                              height: 50,
                              width: 50,
                            ),
                          );
                        },
                      )),
                    ],
                  ),
                ),
                (selectedSong == null)
                    ? Container()
                    : PlayMusicScreen(
                        positionSong: position,
                        listSong: yourLib.value.library[index].playlistYourLib),
              ],
            ),
    );
  }

  Widget search() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: TextField(
        onChanged: (text) => updateList(text),
        decoration: const InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          labelText: 'Search',
          prefixIcon: Icon(Icons.search_outlined),
          prefixIconColor: Colors.white,
        ),
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }

  void updateList(String text) {
    setState(() {
      displayYourLib = yourLib.value.library
          .where((element) =>
              (element.name.toLowerCase()).contains(text.toLowerCase()))
          .toList();
    });
  }
}
