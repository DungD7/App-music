
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart';
import '../model/ListSongModel.dart';

class PlayMusic extends StatefulWidget {
  Items songSelected;
  PlayMusic({
    required this.songSelected,
    super.key
  });
  @override
  State<PlayMusic> createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> {
  final _player = AudioPlayer();
  bool isPlaying = true;
  bool isChangeVolume = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();
    _musicInit();
  }

  _musicInit() async {
    var totalTime =
    await _player.setAudioSource(AudioSource.uri(Uri.parse(
        "${widget.songSelected.track?.previewUrl}")));
    duration = _player.duration!;
    _player.play();
    setState(() {
    });
    _player.positionStream.listen((event) {
      if (event != null) {
        Duration temp = event;
        position = temp;
        setState(() {});
      }
    });
  }
  _playerAction() {
    if(isPlaying) {
      _player.pause();
      isPlaying = false;
    } else {
      _player.play();
      isPlaying = true;
    }
    setState(() {

    });
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const BackButton(
            color: Colors.white,
          )
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: (widget.songSelected == null)?
          const Align(
            alignment: Alignment.center,
            child: SpinKitCircle(
              color: Colors.green,
              size: 50,
            ),
          ):
          Column(
            children: [
              Image.network(
                  '${widget.songSelected.track?.album?.images?[0].url}',
                  width: 250,
                  height: 250,
                  fit: BoxFit.fill
              ),
              const SizedBox(height: 20),
              Text(
                '${widget.songSelected.track?.name}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                "${widget.songSelected.track?.name}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*IconButton(
                    onPressed: () {
                      isChangeVolume = true;
                      setState(() {});
                    },
                    icon: const Icon(Icons.volume_down),
                    color: Colors.white,
                  ),*/
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      _playerAction();
                    },
                    icon: isPlaying?
                    const Icon(
                      Icons.pause_outlined,
                      size: 50,
                      color: Colors.white,
                    ) :
                    const Icon(
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
                  /*IconButton(
                    onPressed: () {

                    },
                    icon: Text("${_player.speed.toStringAsFixed(1)}x",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    color: Colors.white,
                  ),*/
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatTime(position),
                    style:const TextStyle(
                        color: Colors.white
                    ),
                  ),
                  Slider.adaptive(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) {
                      final seekPosition = Duration (seconds: value.toInt());
                      _player.seek(seekPosition);
                      setState(() {});
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.white54,
                  ),
                  Text(
                    formatTime(duration),
                    style: const TextStyle(
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.volume_mute_sharp,
                    color: Colors.white,
                  ),
                  Slider.adaptive(
                    min: 0.0,
                    max: 1.0,
                    value: _player.volume,
                    onChanged:(value) {
                      _player.setVolume(value);
                      setState(() {});
                    },
                    activeColor: Colors.orange,
                    inactiveColor: Colors.white54,
                  ),
                  const Icon(
                    Icons.volume_up_sharp,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        )
    );
  }
  String formatTime (Duration value) {
    String time;
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(value.inHours);
    final minutes = twoDigits(value.inMinutes.remainder(60)) ;
    final seconds = twoDigits(value.inSeconds.remainder(60));
    if (value.inHours > 0) {
      time = '$hours:$minutes:$seconds';
    } else {
      time = '$minutes:$seconds';
    }
    return time;
  }
}




