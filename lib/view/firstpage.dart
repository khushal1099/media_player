import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_player/controller/media_provider.dart';
import 'package:media_player/util.dart';
import 'package:media_player/view/detailpage.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _HomePageState();
}

class _HomePageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    print(
      MediaQuery.sizeOf(context).height * 0.070,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Media Player",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        // elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.asset("assets/images/bg.webp", fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<MediaProvider>(builder: (context, mediapro, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Recently Played",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 190,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: recentplaysongs.length,
                            itemBuilder: (BuildContext context, int index) {
                              var audio = recentplaysongs[index];
                              return InkWell(
                                onTap: () {
                                  assetsAudioPlayer.open(
                                      Playlist(audios: recentplaysongs),
                                      autoStart: false);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPage();
                                      },
                                    ),
                                  );
                                  assetsAudioPlayer.playlistPlayAtIndex(index);
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
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.35,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                    );
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
                                    autoStart: false);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DetailPage();
                                    },
                                  ),
                                );
                                assetsAudioPlayer.playlistPlayAtIndex(index);
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
                            var audio = panjabiaudiolist[index];
                            return InkWell(
                              onTap: () {
                                assetsAudioPlayer.open(
                                    Playlist(audios: panjabiaudiolist),
                                    autoStart: false);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DetailPage();
                                    },
                                  ),
                                );
                                assetsAudioPlayer.playlistPlayAtIndex(index);
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
          Positioned(
            bottom: 10,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.11,
                  width: MediaQuery.sizeOf(context).width * 1,
                  color: Colors.purple,
                  child: StreamBuilder<Playing?>(
                    stream: assetsAudioPlayer.current,
                    builder: (context, snapshot) {
                      var title =
                          snapshot.data?.playlist.current.metas.title ?? "";
                      var album =
                          snapshot.data?.playlist.current.metas.album ?? "";
                      var path =
                          snapshot.data?.playlist.current.metas.image?.path ??
                              "";
                      // return ListTile(
                      //   leading: Image.network(path),
                      //   title: Text(title),
                      //   subtitle: Padding(
                      //     padding: const EdgeInsets.only(bottom: 20),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(album),
                      //         StreamBuilder<Duration>(
                      //           stream: assetsAudioPlayer.currentPosition,
                      //           builder: (context, snapshot) {
                      //             var sec = snapshot.data?.inSeconds ?? 0;
                      //             var min = snapshot.data?.inMinutes ?? 0;
                      //             return StreamBuilder<Playing?>(
                      //               stream: assetsAudioPlayer.current,
                      //               builder: (context, snapshot) {
                      //                 var duration = snapshot.data?.audio.duration;
                      //                 if (duration != null) {
                      //                   return Row(
                      //                     children: [
                      //                       Expanded(
                      //                         child: Slider(
                      //                           value: sec.toDouble(),
                      //                           max: (duration.inSeconds).toDouble(),
                      //                           onChanged: (value) {
                      //                             print("value $value");
                      //                             assetsAudioPlayer
                      //                                 .seek(Duration(seconds: value.toInt()));
                      //                           },
                      //                         ),
                      //                       ),
                      //                       Padding(
                      //                         padding: const EdgeInsets.all(8.0),
                      //                         child: Text("${min % 60}:${sec % 60}",style: TextStyle(color: Colors.white,fontSize: 20),),
                      //                       )
                      //                     ],
                      //                   );
                      //                 } else {
                      //                   return SizedBox.shrink();
                      //                   ;
                      //                 }
                      //               },
                      //             );
                      //           },
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // );
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
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  album,
                                  style: TextStyle(color: Colors.white),
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
                                              Slider(
                                                value: sec.toDouble(),
                                                max: (duration.inSeconds).toDouble(),
                                                onChanged: (value) {
                                                  print("value $value");
                                                  assetsAudioPlayer
                                                      .seek(Duration(seconds: value.toInt()));
                                                },
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
                                        }
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
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
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return IconButton(
                                onPressed: () {
                                  if (playing) {
                                    assetsAudioPlayer.pause();
                                  } else {
                                    assetsAudioPlayer.play();
                                  }
                                  Provider.of<MediaProvider>(context,
                                          listen: false)
                                      .refresh();
                                },
                                icon: Icon(
                                  playing ? Icons.pause : Icons.play_arrow,
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
                          print("length of list :- ${recentplaysongs.length}");
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
