import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:media_player/controller/media_provider.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../util.dart';

class DetailPage extends StatefulWidget {
  int index;

  DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    assetsAudioPlayer.playlistPlayAtIndex(widget.index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 1,
            width: MediaQuery.sizeOf(context).width * 1,
            child: Image.asset(
              "assets/images/bg.webp",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Provider.of<MediaProvider>(context, listen: false)
                          //     .refresh();
                        },
                        icon: Center(
                          child: Icon(
                            Icons.chevron_left_outlined,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),
                      ),
                      Text(
                        "Playing Music",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Center(
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<Playing?>(
                  stream: assetsAudioPlayer.current,
                  builder:
                      (BuildContext context, AsyncSnapshot<Playing?> snapshot) {
                    var currentSong = snapshot.data?.audio;
                    if (currentSong != null) {
                      return Column(
                        children: [
                          Center(
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(
                                currentSong.audio.metas.image?.path ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              currentSong.audio.metas.title ?? "",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Text(
                            currentSong.audio.metas.album ?? "",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text(
                            currentSong.audio.metas.artist ?? "",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ],
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
                StreamBuilder<Playing?>(
                  stream: assetsAudioPlayer.current,
                  builder:
                      (BuildContext context, AsyncSnapshot<Playing?> snapshot) {
                    var song = snapshot.data?.playlist.current;
                    if (recentplaysongs.contains(song)) {
                      print("Already");
                    } else if (song != null) {
                      print("object ${song.metas.title}");
                      recentplaysongs.add(song);
                      SchedulerBinding.instance
                          .addPostFrameCallback((timeStamp) {
                        setState(() {});
                      });
                    }
                    return SizedBox();
                  },
                ),
                StreamBuilder<Duration>(
                  stream: assetsAudioPlayer.currentPosition,
                  builder: (context, snapshot) {
                    var sec = snapshot.data?.inSeconds ?? 0;
                    var min = snapshot.data?.inMinutes ?? 0;
                    return StreamBuilder<Playing?>(
                      stream: assetsAudioPlayer.current,
                      builder: (context, snapshot) {
                        var duration = snapshot.data?.audio.duration;
                        if (duration != null) {
                          return Row(
                            children: [
                              Expanded(
                                child: Slider(
                                  value: sec.toDouble(),
                                  max: (duration.inSeconds).toDouble(),
                                  onChanged: (value) {
                                    print("value $value");
                                    assetsAudioPlayer
                                        .seek(Duration(seconds: value.toInt()));
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${min % 60}:${sec % 60}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )
                            ],
                          );
                        } else {
                          return SizedBox.shrink();
                          ;
                        }
                      },
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Provider.of<MediaProvider>(context, listen: false)
                            .restartCurrentSong();
                      },
                      icon: Icon(
                        Icons.repeat,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        assetsAudioPlayer.previous();
                      },
                      icon: Icon(
                        Icons.skip_previous,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    StreamBuilder<bool>(
                      stream: assetsAudioPlayer.isPlaying,
                      builder: (context, snapshot) {
                        var playing = snapshot.data ?? false;
                        return StreamBuilder<bool>(
                          stream: assetsAudioPlayer.isBuffering,
                          builder: (context, snapshot1) {
                            if (snapshot1.data ?? false) {
                              return SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(),
                              );
                            }
                            return IconButton(
                              onPressed: () {
                                assetsAudioPlayer.playOrPause();
                              },
                              icon: Icon(
                                playing ? Icons.pause : Icons.play_arrow,
                                size: 55,
                                color: Colors.white,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        assetsAudioPlayer.next();
                        print("length of list :- ${recentplaysongs.length}");
                      },
                      icon: Icon(
                        Icons.skip_next,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        size: 25,
                      ),
                      color: Colors.white,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.download, size: 30),
                        color: Colors.white),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
