
import 'package:flutter/material.dart';
import '../widget/SuggestionList.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green
                      ),
                      child: const  Center(child:Text("D")),
                    ),
                    const Text(
                      'Spotify',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                nameListView(name: 'Trending Now'),
                const SuggestionList(),
                const SizedBox(height: 10,),
                //const SuggestionList(),
              ],
            ),
          ),
        ),
    );
  }
}

class nameListView extends StatelessWidget {
  String name;
  nameListView({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
            name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}




