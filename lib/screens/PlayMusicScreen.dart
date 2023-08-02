import 'package:app_music/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:miniplayer/miniplayer.dart';

import '../models/ListSongModel.dart';

class PlayMusicScreen extends StatefulWidget {
  int? positionSong;
  List<ItemSongs> listSong;
  PlayMusicScreen(
      {required this.positionSong, required this.listSong, super.key});

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  final _player = AudioPlayer();
  bool isPlaying = true;
  bool isChangeVolume = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  //ItemSongs? selectedSong;
  String? currentlySong;

  @override
  void initState() {
    super.initState();
    _musicInit(widget.positionSong!);
  }

  _musicInit(int positionSong) async {
    isCurrentPlaying.value = true;
    currentPlaylist.value = widget.listSong;
    positionCurrentPlaying.value = widget.positionSong;
    currentlySong = widget.listSong[widget.positionSong!].track?.name;
    isPlaying = true;
    await _player.setAudioSource(AudioSource.uri(
        Uri.parse("${widget.listSong[positionSong].track?.previewUrl}")));
    duration = _player.duration!;
    _player.play();
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
    if (duration != Duration.zero && position == duration) {
      skipNextSong();
    }
    if (currentlySong != widget.listSong[widget.positionSong!].track?.name) {
      _musicInit(widget.positionSong!);
    }
    return Miniplayer(
      elevation: 4,
      minHeight: 70,
      curve: Curves.easeOut,
      maxHeight: MediaQuery.of(context).size.height,
      builder: (height, percentage) {
        if (250 < height && height <= 550) {
          return miniPlayerToFullScreen(height);
        }
        if (height <= 250) {
          return miniPlayerMusic(height);
        } else {
          return playMusicFullScreen();
        }
      },
    );
  }

  Widget miniPlayerToFullScreen(double height) {
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
            '${widget.listSong[widget.positionSong!].track?.album?.images?.first.url}',
            height: height,
          ),
        ),
      ),
    );
  }

  Container miniPlayerMusic(double height) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                '${widget.listSong[widget.positionSong!].track?.album?.images?.first.url}',
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
                        '${widget.listSong[widget.positionSong!].track?.name}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${widget.listSong[widget.positionSong!].track?.artists?.first.name}",
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
          timeSlider()
        ],
      ),
    );
  }

  LinearProgressIndicator timeSlider() {
    return LinearProgressIndicator(
      value: (position.inSeconds.toDouble() == 0)
          ? 0
          : (position.inSeconds.toDouble() / duration.inSeconds.toDouble()),
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
    );
  }

  Widget playMusicFullScreen() {
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
              '${widget.listSong[widget.positionSong!].track?.album?.images?.first.url}',
              width: 250,
              height: 250,
              fit: BoxFit.fill),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              '${widget.listSong[widget.positionSong!].track?.name}',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "${widget.listSong[widget.positionSong!].track?.artists?.first.name}",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
          optionButtons(),
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
                    if (position == duration) {
                      skipNextSong();
                    }
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
          ),
          const SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
            itemCount: widget.listSong.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  if (widget.positionSong != index) {
                    setState(() {
                      widget.positionSong = index;
                    });
                  }
                },
                title: Text(
                  '${widget.listSong[index].track?.album?.name}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  '${widget.listSong[index].track?.artists?.first.name}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                leading: Image.network(
                  '${widget.listSong[index].track?.album?.images?.first.url}',
                  height: 50,
                  width: 50,
                ),
              );
            },
          )),
        ],
      ),
    );
  }

  Widget optionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              if (widget.positionSong! > 0) {
                widget.positionSong = widget.positionSong! - 1;
              } else {
                widget.positionSong = widget.listSong.length - 1;
              }
            });
          },
          icon: const Icon(
            Icons.skip_previous,
            size: 35,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            replay10s();
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
            forward10s();
          },
          icon: const Icon(
            Icons.forward_10,
            size: 35,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            skipNextSong();
          },
          icon: const Icon(Icons.skip_next, size: 35),
          color: Colors.white,
        ),
      ],
    );
  }

  void skipNextSong() {
    return setState(() {
      if (widget.positionSong! < (widget.listSong.length - 1)) {
        widget.positionSong = widget.positionSong! + 1;
      } else {
        widget.positionSong = 0;
      }
    });
  }

  void forward10s() {
    final Duration seekPosition;
    if (position.inSeconds.toInt() + 10 > duration.inSeconds.toInt()) {
      seekPosition = duration;
    } else {
      seekPosition = Duration(seconds: (position.inSeconds.toInt()) + 10);
    }
    _player.seek(seekPosition);
    setState(() {});
  }

  void replay10s() {
    final Duration seekPosition;
    if (position.inSeconds.toInt() <= 10) {
      seekPosition = const Duration(seconds: 0);
    } else {
      seekPosition = Duration(seconds: (position.inSeconds.toInt()) - 10);
    }
    _player.seek(seekPosition);
    setState(() {});
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
