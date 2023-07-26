import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../model/ListSongModel.dart';

class PlayMusic extends StatefulWidget {
  ItemSongs selectedSong;
  PlayMusic({required this.selectedSong, super.key});
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
    await _player.setAudioSource(
        AudioSource.uri(Uri.parse("${widget.selectedSong.track?.previewUrl}")));
    duration = _player.duration!;
    _player.play();
    setState(() {});
    _player.positionStream.listen((event) {
      Duration temp = event;
      position = temp;
      setState(() {});
    });
  }

  _playerAction() {
    if (isPlaying) {
      _player.pause();
      isPlaying = false;
    } else {
      _player.play();
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              color: Colors.white,
            ),
          ),
          Image.network('${widget.selectedSong.track?.album?.images?[0].url}',
              width: 250, height: 250, fit: BoxFit.fill),
          const SizedBox(height: 10),
          Text(
            '${widget.selectedSong.track?.name}',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            "${widget.selectedSong.track?.artists?[0].name}",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_previous,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.replay_10,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  _playerAction();
                },
                icon: isPlaying
                    ? const Icon(
                        Icons.pause_outlined,
                        size: 50,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.play_circle_fill_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.forward_10,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_next, size: 35),
                color: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatTime(position),
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 250,
                child: Slider.adaptive(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) {
                    final seekPosition = Duration(seconds: value.toInt());
                    _player.seek(seekPosition);
                    setState(() {});
                  },
                  activeColor: Colors.red,
                  inactiveColor: Colors.white54,
                ),
              ),
              Text(
                formatTime(duration),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.volume_mute_sharp,
                color: Colors.white,
              ),
              SizedBox(
                width: 250,
                child: Slider.adaptive(
                  min: 0.0,
                  max: 1.0,
                  value: _player.volume,
                  onChanged: (value) {
                    _player.setVolume(value);
                    setState(() {});
                  },
                  activeColor: Colors.white,
                  inactiveColor: Colors.white54,
                ),
              ),
              const Icon(
                Icons.volume_up_sharp,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }

  String formatTime(Duration value) {
    String time;
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(value.inHours);
    final minutes = twoDigits(value.inMinutes.remainder(60));
    final seconds = twoDigits(value.inSeconds.remainder(60));
    if (value.inHours > 0) {
      time = '$hours:$minutes:$seconds';
    } else {
      time = '$minutes:$seconds';
    }
    return time;
  }
}
