
import 'package:flutter/material.dart';


class PlayMusic extends StatefulWidget {
  const PlayMusic({super.key});

  @override
  State<PlayMusic> createState() => _PlayMusicState();
}


class _PlayMusicState extends State<PlayMusic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Audio player"),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/splash.png'),
              const SizedBox(height: 20),
              const Text(
                "Music name",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Artist",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.volume_down),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle_outline,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.timer),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "00:00",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  Slider.adaptive(
                    value: 0,
                    onChanged: (value) {
                    },
                    activeColor: Colors.black,
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}

