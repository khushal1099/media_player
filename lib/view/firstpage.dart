import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_player/util.dart';
import 'package:media_player/view/detailpage.dart';
import '../main.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _HomePageState();
}

class _HomePageState extends State<FirstPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    print(
      MediaQuery.sizeOf(context).height * 0.070,
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.asset("assets/images/bg.webp", fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  StreamBuilder<Playing?>(
                      stream: assetsAudioPlayer.current,
                      builder: (context, snapshot) {
                        var checkdata = snapshot.data?.playlist.current;
                        return checkdata != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Recently Played",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 190,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: recentplaysongs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var audio = recentplaysongs[index];
                                        return InkWell(
                                          onTap: () {
                                            assetsAudioPlayer.open(
                                              Playlist(audios: recentplaysongs),
                                              autoStart: false,
                                              showNotification: true,
                                              // Show notification when audio starts playing
                                              notificationSettings:
                                                  NotificationSettings(
                                                customPlayPauseAction:
                                                    (player) async {
                                                  // Handle play/pause action from notification
                                                  if (player.isPlaying.value) {
                                                    player.pause();
                                                  } else {
                                                    player.play();
                                                  }
                                                },
                                              ),
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return DetailPage(
                                                    index: index,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.15,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.35,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Image.network(
                                                    audio.metas.image?.path ??
                                                        "",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                audio.metas.title ?? "",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox();
                      }),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Bollywood Songs",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: audiolist.length,
                          itemBuilder: (BuildContext context, int index) {
                            var audio = audiolist[index];
                            return InkWell(
                              onTap: () {
                                assetsAudioPlayer.open(
                                  Playlist(audios: audiolist),
                                  autoStart: false,
                                  showNotification: true,
                                  // Show notification when audio starts playing
                                  notificationSettings: NotificationSettings(
                                    customPlayPauseAction: (player) async {
                                      // Handle play/pause action from notification
                                      if (player.isPlaying.value) {
                                        player.pause();
                                      } else {
                                        player.play();
                                      }
                                    },
                                  ),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DetailPage(
                                        index: index,
                                      );
                                    },
                                  ),
                                );
                                // assetsAudioPlayer.playlistPlayAtIndex(index);
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.15,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.35,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.network(
                                        audio.metas.image?.path ?? "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    audio.metas.title ?? "",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Panjabi Songs",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: panjabiaudiolist.length,
                          itemBuilder: (BuildContext context, int index) {
                            var audio = panjabiaudiolist[index];
                            return InkWell(
                              onTap: () {
                                assetsAudioPlayer.open(
                                  Playlist(audios: panjabiaudiolist),
                                  autoStart: false,
                                  showNotification: true,
                                  // Show notification when audio starts playing
                                  notificationSettings: NotificationSettings(
                                    customPlayPauseAction: (player) async {
                                      // Handle play/pause action from notification
                                      if (player.isPlaying.value) {
                                        player.pause();
                                      } else {
                                        player.play();
                                      }
                                    },
                                  ),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DetailPage(
                                        index: index,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.15,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.35,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.network(
                                        audio.metas.image?.path ?? "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    audio.metas.title ?? "",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder<Playing?>(
              stream: assetsAudioPlayer.current,
              builder: (context, snapshot) {
                var playcurrent = snapshot.data?.playlist.current;
                return playcurrent != null
                    ? Positioned(
                        bottom: 10,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return DetailPage(index: index);
                                  },
                                ));
                              },
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.11,
                                width: MediaQuery.sizeOf(context).width * 1,
                                color: Colors.purple,
                                child: StreamBuilder<Playing?>(
                                  stream: assetsAudioPlayer.current,
                                  builder: (context, snapshot) {
                                    var title = snapshot.data?.playlist.current
                                            .metas.title ??
                                        "";
                                    var album = snapshot.data?.playlist.current
                                            .metas.album ??
                                        "";
                                    var path = snapshot.data?.playlist.current
                                            .metas.image?.path ??
                                        "";
                                    return Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          height: 70,
                                          width: 70,
                                          color: Colors.grey,
                                          child: Image.network(path),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                title,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                album,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      assetsAudioPlayer.previous();
                                    },
                                    icon: Icon(
                                      Icons.skip_previous,
                                      size: 20,
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
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                          return IconButton(
                                            onPressed: () {
                                              if (playing) {
                                                assetsAudioPlayer.pause();
                                              } else {
                                                assetsAudioPlayer.play();
                                              }
                                            },
                                            icon: Icon(
                                              playing
                                                  ? Icons.pause
                                                  : Icons.play_arrow,
                                              size: 25,
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
                                      print(
                                          "length of list :- ${recentplaysongs.length}");
                                    },
                                    icon: Icon(
                                      Icons.skip_next,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 67),
                              child: StreamBuilder<Duration>(
                                stream: assetsAudioPlayer.currentPosition,
                                builder: (context, snapshot) {
                                  var sec = snapshot.data?.inSeconds ?? 0;
                                  var min = snapshot.data?.inMinutes ?? 0;
                                  return StreamBuilder<Playing?>(
                                    stream: assetsAudioPlayer.current,
                                    builder: (context, snapshot) {
                                      var duration =
                                          snapshot.data?.audio.duration;
                                      if (duration != null) {
                                        return Row(
                                          children: [
                                            Slider(
                                              value: sec.toDouble(),
                                              max: (duration.inSeconds)
                                                  .toDouble(),
                                              onChanged: (value) {
                                                print("value $value");
                                                assetsAudioPlayer.seek(Duration(
                                                    seconds: value.toInt()));
                                              },
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${min % 60}:${sec % 60}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            )
                                          ],
                                        );
                                      } else {
                                        return SizedBox.shrink();
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox();
              }),
        ],
      ),
    );
  }
}
