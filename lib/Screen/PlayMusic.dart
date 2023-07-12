
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../model/SongModel.dart';

class PlayMusic extends StatefulWidget {
  Song songSelected;
  PlayMusic({
    required this.songSelected,
    super.key
  });
  @override
  State<PlayMusic> createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> {
  final _player = AudioPlayer();

  @override
  void initState() {

    super.initState();
    _musicInit();
  }

  _musicInit() async{
    var totalTime =
       await _player.setAudioSource(AudioSource.uri(Uri.parse(
           'https://mp3-s1-zmp3.zmdcdn.me/ea859fb645f2acacf5e3/2153293163773944052?authen=exp=1689299084~acl=/ea859fb645f2acacf5e3/*~hmac=ba4eb4d0066f541e9ab3a28d20fada2a&fs=MTY4OTEyNjI4NDgxN3x3ZWJWNHwxMjMdUngMjkdUngNjmUsICdUngMg')));
    print('print: $totalTime');
  }
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.network(
                '${widget.songSelected.thumbnail}',
                width: 250,
                height: 250,
                fit: BoxFit.fill
              ),
              const SizedBox(height: 20),
              Text(
                '${widget.songSelected.name}',
                style:const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
             Text(
                "${widget.songSelected.artist?.name}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.volume_down),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle_outline,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.timer),
                    color: Colors.white,
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
                        color: Colors.white
                    ),
                  ),
                  Slider.adaptive(
                    value: 0,
                    onChanged: (value) {
                    },
                    activeColor: Colors.white,
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}

