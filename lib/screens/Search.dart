import 'package:app_music/models/LibraryModel.dart';
import 'package:flutter/material.dart';

import '../widgets/album/list_albums.dart';
import '../widgets/list_artists.dart';
import '../widgets/list_playlists.dart';
import '../widgets/list_tracks.dart';

ValueNotifier<LibraryModel> yourLib = ValueNotifier(LibraryModel(library: []));
ValueNotifier<String> query = ValueNotifier<String>('');

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // PlaylistsModel? playlistsData;
  // ItemSongs? selectedSong;
  // List<ItemSongs> listSong = [];
  // List<ItemSongs> displayList = [];
  // int? position;

  int currentIndex = 0;
  List<Widget> body = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void updateBodyScreens(String query) {
    body = [
      Container(),
      ListTracks(
          urlTracks:
              'https://api.spotify.com/v1/search?q=$query&type=track&market=vn&offset=0&limit=50'),
      ListPlaylists(
          urlPlaylists:
              'https://api.spotify.com/v1/search?q=$query&type=playlist&market=vn&offset=0&limit=50'),
      ListArtists(
          urlArtists:
              'https://api.spotify.com/v1/search?q=$query&type=artist&market=vn&offset=0&limit=50'),
      ListAlbums(
          urlAlbums:
              'https://api.spotify.com/v1/search?q=$query&type=album&market=vn&offset=0&limit=50'),
    ];
  }

  void updateList(String value) {
    query.value = value;
    setState(() {
      updateBodyScreens(value);
      currentIndex = 0;
    });
  }

  Color bgColor = Colors.grey.shade800;
  Color txtColor = Colors.white;

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
              search(),
              const SizedBox(height: 5),
              // Expanded(child: showListSongs())
              bodySearch(),
            ],
          ),
        ),
        // (selectedSong == null)
        //     ? Container()
        //     : PlayMusicScreen(
        //         //selectedSong: selectedSong,
        //         positionSong: position,
        //         listSong: displayList)
      ],
    ));
  }

  Widget search() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: TextField(
        onChanged: (value) => updateList(value),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(width: 2, color: Colors.white70)),
            labelText: 'Search',
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.white70,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 2, color: Colors.green),
            )),
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }

  Widget bodySearch() {
    return Expanded(
        child: Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            currentIndex == 1 ? Colors.green : bgColor)),
                    child: Text(
                      'Track',
                      style: TextStyle(
                        color: currentIndex == 1 ? Colors.black : txtColor,
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            currentIndex == 2 ? Colors.green : bgColor)),
                    child: Text(
                      'Playlist',
                      style: TextStyle(
                        color: currentIndex == 2 ? Colors.black : txtColor,
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            currentIndex == 3 ? Colors.green : bgColor)),
                    child: Text(
                      'Artist',
                      style: TextStyle(
                        color: currentIndex == 3 ? Colors.black : txtColor,
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            currentIndex == 4 ? Colors.green : bgColor)),
                    child: Text(
                      'Album',
                      style: TextStyle(
                        color: currentIndex == 4 ? Colors.black : txtColor,
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        currentIndex = 4;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(child: body[currentIndex]),
      ],
    ));
  }

  // addListSongs() {
  //   int count = 0;
  //   for (int i = 0; i < playlistsData!.playlists!.items!.length; i++) {
  //     var urlListPlay = playlistsData!.playlists!.items![i].href;
  //     CallApiSpotify.fetchApiListSong(urlListPlay.toString()).then((data) {
  //       final listSongData = data;
  //       count++;
  //       if (listSongData != null) {
  //         for (int j = 0; j < listSongData.tracks!.items!.length; j++) {
  //           ItemSongs itemSong = listSongData.tracks!.items![j];
  //           bool check = true;
  //           for (int k = 0; k < listSong.length; k++) {
  //             if (itemSong.track?.name == listSong[k].track?.name) {
  //               check = false;
  //             }
  //           }
  //           if (check == true) {
  //             listSong.add(itemSong);
  //           }
  //         }
  //       }
  //       if (count == playlistsData!.playlists!.items!.length) {
  //         displayList = listSong;
  //         setState(() {});
  //       }
  //     });
  //   }
  // }
  //
  // Widget showListSongs() {
  //   return (displayList.isEmpty)
  //       ? const SpinKitCircle(
  //           color: Colors.green,
  //           size: 50,
  //         )
  //       : ListView.builder(
  //           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
  //           itemCount: displayList.length,
  //           itemBuilder: (context, index) {
  //             return ListTile(
  //               onTap: () {
  //                 position = index;
  //                 selectedSong = displayList[index];
  //                 setState(() {});
  //               },
  //               title: Text(
  //                 '${displayList[index].track?.album?.name}',
  //                 style: const TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 17,
  //                 ),
  //               ),
  //               subtitle: Text(
  //                 '${displayList[index].track?.artists?.first.name}',
  //                 style: const TextStyle(
  //                   color: Colors.white70,
  //                   fontSize: 12,
  //                 ),
  //               ),
  //               trailing: IconButton(
  //                 onPressed: () {
  //                   showDialog(
  //                     context: context,
  //                     builder: (context) {
  //                       return StatefulBuilder(
  //                         builder: (context, setState) {
  //                           return Dialog.fullscreen(
  //                               backgroundColor: Colors.black.withOpacity(0.8),
  //                               child: Column(
  //                                 children: [
  //                                   const SizedBox(height: 80),
  //                                   Container(
  //                                     color: Colors.grey.shade900,
  //                                     child: Row(
  //                                       children: [
  //                                         TextButton(
  //                                             onPressed: () {
  //                                               setIsChecked();
  //                                               Navigator.pop(context);
  //                                             },
  //                                             child: const Text('cancel',
  //                                                 textAlign: TextAlign.center,
  //                                                 style: TextStyle(
  //                                                     color: Colors.white,
  //                                                     fontSize: 15,
  //                                                     fontWeight:
  //                                                         FontWeight.w300))),
  //                                         SizedBox(
  //                                             width: MediaQuery.of(context)
  //                                                     .size
  //                                                     .width *
  //                                                 0.17),
  //                                         const Text(
  //                                           "Add to playlist",
  //                                           textAlign: TextAlign.center,
  //                                           style: TextStyle(
  //                                               color: Colors.white,
  //                                               fontSize: 18,
  //                                               fontWeight: FontWeight.w500),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   const SizedBox(height: 15),
  //                                   TextButton(
  //                                     onPressed: () {
  //                                       String name = 'New playlist';
  //                                       showDialog<void>(
  //                                         context: context,
  //                                         builder:
  //                                             (BuildContext dialogContext) {
  //                                           return AlertDialog(
  //                                             backgroundColor: Colors.white,
  //                                             title: const Text(
  //                                               'Give your playlist a name',
  //                                               style: TextStyle(
  //                                                   color: Colors.black,
  //                                                   fontSize: 20),
  //                                             ),
  //                                             content: TextField(
  //                                               onChanged: (value) {
  //                                                 name = value;
  //                                               },
  //                                               decoration: InputDecoration(
  //                                                 hintText: name,
  //                                               ),
  //                                             ),
  //                                             actions: <Widget>[
  //                                               Center(
  //                                                 child: TextButton(
  //                                                   style: ButtonStyle(
  //                                                       backgroundColor:
  //                                                           MaterialStateProperty
  //                                                               .all(Colors
  //                                                                   .green)),
  //                                                   child: const Text(
  //                                                     'Create',
  //                                                     style: TextStyle(
  //                                                       color: Colors.black,
  //                                                       fontSize: 15,
  //                                                     ),
  //                                                   ),
  //                                                   onPressed: () {
  //                                                     List<ItemSongs> list = [];
  //                                                     list.add(
  //                                                         displayList[index]);
  //                                                     NewPlaylist newPlaylist =
  //                                                         NewPlaylist(
  //                                                             name: name,
  //                                                             playlistYourLib:
  //                                                                 list);
  //                                                     yourLib.value.library
  //                                                         .add(newPlaylist);
  //                                                     Navigator.pop(
  //                                                         dialogContext);
  //                                                     Navigator.pop(
  //                                                         context); // Dismiss alert dialog
  //                                                   },
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           );
  //                                         },
  //                                       );
  //                                     },
  //                                     style: ButtonStyle(
  //                                         backgroundColor:
  //                                             MaterialStateProperty.all(
  //                                                 Colors.white)),
  //                                     child: const Padding(
  //                                       padding: EdgeInsets.symmetric(
  //                                           horizontal: 15, vertical: 5),
  //                                       child: Text(
  //                                         "New playlist",
  //                                         style: TextStyle(
  //                                             color: Colors.black,
  //                                             fontSize: 15,
  //                                             fontWeight: FontWeight.bold),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   const SizedBox(height: 20),
  //                                   Expanded(
  //                                     child: ListView.builder(
  //                                       itemCount: yourLib.value.library.length,
  //                                       itemBuilder: (context, index) {
  //                                         return ListTile(
  //                                           title: Text(
  //                                             yourLib.value.library[index].name,
  //                                             overflow: TextOverflow.ellipsis,
  //                                             style: const TextStyle(
  //                                               color: Colors.white,
  //                                               fontSize: 17,
  //                                             ),
  //                                           ),
  //                                           subtitle: yourLib
  //                                                   .value
  //                                                   .library[index]
  //                                                   .playlistYourLib
  //                                                   .isEmpty
  //                                               ? Text(
  //                                                   '${yourLib.value.library[index].playlistYourLib.length} track',
  //                                                   style: const TextStyle(
  //                                                     color: Colors.white70,
  //                                                     fontSize: 14,
  //                                                   ),
  //                                                 )
  //                                               : Text(
  //                                                   '${yourLib.value.library[index].playlistYourLib.length} tracks',
  //                                                   style: const TextStyle(
  //                                                     color: Colors.white70,
  //                                                     fontSize: 14,
  //                                                   ),
  //                                                 ),
  //                                           leading: yourLib
  //                                                   .value
  //                                                   .library[index]
  //                                                   .playlistYourLib
  //                                                   .isEmpty
  //                                               ? Image.asset(
  //                                                   'assets/image_playlist.jpg',
  //                                                   height: 50,
  //                                                   width: 50,
  //                                                 )
  //                                               : Image.network(
  //                                                   '${yourLib.value.library[index].playlistYourLib.first.track?.album?.images?.first.url}',
  //                                                   height: 50,
  //                                                   width: 50,
  //                                                 ),
  //                                           trailing: Checkbox(
  //                                             shape: RoundedRectangleBorder(
  //                                                 borderRadius:
  //                                                     BorderRadius.circular(
  //                                                         50)),
  //                                             onChanged: (newBool) {
  //                                               setState(() {
  //                                                 yourLib.value.library[index]
  //                                                     .isChecked = newBool!;
  //                                               });
  //                                             },
  //                                             value: yourLib.value
  //                                                 .library[index].isChecked,
  //                                             checkColor: Colors.white,
  //                                             activeColor: Colors.green,
  //                                           ),
  //                                         );
  //                                       },
  //                                     ),
  //                                   ),
  //                                   TextButton(
  //                                     style: ButtonStyle(
  //                                         backgroundColor:
  //                                             MaterialStateProperty.all(
  //                                                 Colors.green)),
  //                                     onPressed: () {
  //                                       addMusicToLib(index);
  //                                       setIsChecked();
  //                                       Navigator.pop(context);
  //                                     },
  //                                     child: const Padding(
  //                                       padding: EdgeInsets.symmetric(
  //                                           horizontal: 20.0),
  //                                       child: Text(
  //                                         'Done',
  //                                         style: TextStyle(
  //                                           color: Colors.black,
  //                                           fontSize: 15,
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                   const SizedBox(height: 20),
  //                                 ],
  //                               ));
  //                         },
  //                       );
  //                     },
  //                   );
  //                 },
  //                 icon: const Icon(
  //                   Icons.more_horiz,
  //                   color: Colors.green,
  //                   size: 25,
  //                 ),
  //               ),
  //               leading: Image.network(
  //                   '${displayList[index].track?.album?.images?.first.url}'),
  //             );
  //           });
  // }
  //
  // void addMusicToLib(int index) {
  //   for (int i = 0; i < yourLib.value.library.length; i++) {
  //     if (yourLib.value.library[i].isChecked == true) {
  //       bool checkMusic = false;
  //       for (int j = 0;
  //           j < yourLib.value.library[i].playlistYourLib.length;
  //           j++) {
  //         if (listSong[index] == yourLib.value.library[i].playlistYourLib[j]) {
  //           checkMusic = true;
  //         }
  //       }
  //       if (checkMusic == false) {
  //         yourLib.value.library[i].playlistYourLib.add(listSong[index]);
  //       }
  //     }
  //   }
  // }
  //
  // void setIsChecked() {
  //   for (int i = 0; i < yourLib.value.library.length; i++) {
  //     yourLib.value.library[i].isChecked = false;
  //   }
  // }
}
