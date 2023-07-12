
import 'package:app_music/api/CallApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/SongModel.dart';
import 'ItemMusic.dart';

class SuggestionList extends StatefulWidget {
  const SuggestionList({
    super.key,
  });

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  SongModel? musicData;

  @override
  void initState() {
    CallApi.fetchApi().then((data){
      setState(() {
        if(data!= null) {
          musicData = data;
        }
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 170,
        child: (musicData == null)?
        const Align(
          alignment: Alignment.center,
          child: SpinKitCircle(
            color: Colors.green,
            size: 50,
          ),
        ):
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index){
            return ItemMusic(song: musicData!.song![index]);
          }
        ),
      ),
    );
  }
}