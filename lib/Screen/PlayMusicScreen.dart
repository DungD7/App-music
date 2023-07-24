import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:miniplayer/miniplayer.dart';

import '../model/ListSongModel.dart';

class PlayMusicScreen extends StatefulWidget {
  ItemSongs? selectedSong;
  PlayMusicScreen({required this.selectedSong, super.key});

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  final _player = AudioPlayer();
  bool isPlaying = true;
  bool isChangeVolume = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  ItemSongs? selectedSong;
  String? currentlySong;

  @override
  void initState() {
    super.initState();
    debugPrint("init 123123");
    _musicInit();
  }

  _musicInit() async {
    currentlySong = widget.selectedSong?.track?.name;
    isPlaying = true;
    await _player.setAudioSource(AudioSource.uri(
        Uri.parse("${widget.selectedSong?.track?.previewUrl}")));
    duration = _player.duration!;
    _player.play();
    setState(() {});
    _player.positionStream.listen((event) {
      if (event != null) {
        Duration temp = event;
        position = temp;
        setState(() {});
      }
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
    if (currentlySong != widget.selectedSong?.track?.name) {
      _musicInit();
    }
    return Miniplayer(
      elevation: 4,
      minHeight: 70,
      curve: Curves.easeOut,
      maxHeight: MediaQuery.of(context).size.height,
      builder: (height, percentage) {
        if (widget.selectedSong == null) {
          return const SizedBox.shrink();
        }
        if (250 < height && height <= 530) {
          return Container(
            color: Colors.black,
            child: Align(
              //alignment: Alignment.centerLeft,
              child: Padding(
                padding: (height <= 250)
                    ? const EdgeInsets.only(bottom: 0)
                    : EdgeInsets.only(
                        top: (height - 250 <= 40) ? height - 250 : 40,
                        bottom: (height <= 290) ? 0 : height - 290),
                child: Image.network(
                  '${widget.selectedSong?.track?.album?.images?[0].url}',
                  height: height,
                ),
              ),
            ),
          );
        }
        if (height <= 250) {
          return Container(
            color: Colors.black,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.network(
                      '${widget.selectedSong?.track?.album?.images?[0].url}',
                      height: height - 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${widget.selectedSong?.track?.name}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${widget.selectedSong?.track?.artists?[0].name}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _playerAction();
                      },
                      icon: isPlaying
                          ? const Icon(
                              Icons.pause_outlined,
                              size: 35,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.play_arrow_rounded,
                              size: 35,
                              color: Colors.white,
                            ),
                    ),
                  ],
                ),
                LinearProgressIndicator(
                  value: position.inSeconds.toDouble(),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                )
              ],
            ),
          );
        } else {
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
                Image.network(
                    '${widget.selectedSong?.track?.album?.images?[0].url}',
                    width: 250,
                    height: 250,
                    fit: BoxFit.fill),
                const SizedBox(height: 10),
                Text(
                  '${widget.selectedSong?.track?.name}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${widget.selectedSong?.track?.artists?[0].name}",
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
                      onPressed: () {
                        final Duration seekPosition;
                        if (position.inSeconds.toInt() <= 10) {
                          seekPosition = const Duration(seconds: 0);
                        } else {
                          seekPosition = Duration(
                              seconds: (position.inSeconds.toInt()) - 10);
                        }
                        _player.seek(seekPosition);
                        setState(() {});
                      },
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
                      onPressed: () {
                        final Duration seekPosition;
                        if (position.inSeconds.toInt() + 10 >
                            duration.inSeconds.toInt()) {
                          seekPosition = duration;
                        } else {
                          seekPosition = Duration(
                              seconds: (position.inSeconds.toInt()) + 10);
                        }
                        _player.seek(seekPosition);
                        setState(() {});
                      },
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
      },
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
