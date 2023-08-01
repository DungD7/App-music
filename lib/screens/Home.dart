import 'package:flutter/material.dart';

import '../widgets/SuggestionList.dart';

class Home extends StatelessWidget {
  Home({super.key});
  TimeOfDay currentTime = TimeOfDay.now();
  String? greeting;

  getGreeting() {
    if (currentTime.hour.toInt() >= 5 && currentTime.hour.toInt() < 12) {
      greeting = 'Good morning';
    } else if (currentTime.hour.toInt() >= 12 &&
        currentTime.hour.toInt() < 18) {
      greeting = 'Good afternoon';
    } else {
      greeting = 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    getGreeting();
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
                        color: Colors.green),
                    child: const Center(child: Text("D")),
                  ),
                  Text(
                    '$greeting',
                    style: const TextStyle(color: Colors.white, fontSize: 27),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              namePlaylists('Trending'),
              const SuggestionList(),
              const SizedBox(
                height: 10,
              ),
              //const SuggestionList(),
            ],
          ),
        ),
      ),
    );
  }

  Align namePlaylists(String name) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
