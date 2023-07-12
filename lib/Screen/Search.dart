import 'package:app_music/model/SongModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../api/CallApi.dart';
import 'PlayMusic.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => _SearchState();
}
class _SearchState extends State<Search> {
  SongModel? musicData;
  List<Song>? displayList;


  void updateList(String value) {
    setState(() {
      displayList = musicData?.song?.where((element) =>
          element.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  // use data from api (List <Song>)
  @override
  void initState() {
    super.initState();
    CallApi.fetchApi().then((data) {
      setState(() {
        musicData = data;
        displayList = musicData?.song;
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
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                child: TextField(
                  onChanged: (value) => updateList(value),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search_outlined),
                    prefixIconColor: Colors.white,
                  ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17
                ),
                ),
              ),
              const SizedBox(height: 20,),
              Expanded(
                  child: (displayList == null)?
                  const SpinKitCircle(
                    color: Colors.green,
                    size: 50,
                  ):
                  ListView.builder(
                    itemCount: displayList?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => PlayMusic(songSelected: displayList![index])));
                        },
                        title: Text(
                          '${displayList?[index].name}',
                          style:const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        subtitle: Text(
                          '${displayList?[index].artistsNames}',
                          style:const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        trailing: Text(
                          '${displayList?[index].total}',
                          style:const TextStyle(
                            color: Colors.greenAccent,
                            //fontSize: 15,
                          ),
                        ),
                        leading: Image.network('${displayList?[index].thumbnail}'
                        ),
                      );
                    }
                  )
              )
            ],
          ),
        )
    );
  }
}
