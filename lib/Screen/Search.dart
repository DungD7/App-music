import 'package:app_music/model/SongModel.dart';
import 'package:flutter/material.dart';

import '../api/CallApi.dart';
import '../model/SongModelEntity.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => _SearchState();
}
class _SearchState extends State<Search> {
  List<Song> musicData = [];
  @override
  void initState() {
    super.initState();
    CallApi.fetchApi().then((data) {
      setState(() {
        musicData = data;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
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
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search_outlined),
                    prefixIconColor: Colors.white,
                  ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17
                ),
                ),
              ),
              Container(
                child: Text('${musicData.length}',
                  style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                ),),
              )
            ],
          ),
        )
    );
  }
}
