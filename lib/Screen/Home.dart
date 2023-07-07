
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
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'Recently played',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SuggestionList(),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Shows to try',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SuggestionList(),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Popular radio',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SuggestionList(),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Recently played',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SuggestionList(),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Recently played',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SuggestionList(),
              ],
            ),
          ),
        ),
    );
  }
}




