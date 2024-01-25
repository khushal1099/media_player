import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_player/controller/media_provider.dart';
import 'package:media_player/util.dart';
import 'package:media_player/view/detailpage.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    assetsAudioPlayer.open(Playlist(audios: audiolist),autoStart: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Media Player",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.asset("assets/images/bg.webp", fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                Consumer<MediaProvider>(
                  builder: (context,mediapro,child) {
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
                          height: 240,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: recentplaysongs.length,
                            itemBuilder: (BuildContext context, int index) {
                              var audio = recentplaysongs[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPage(audio: audio,);
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
                                        MediaQuery.sizeOf(context).height * 0.2,
                                        width:
                                        MediaQuery.sizeOf(context).width * 0.4,
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
                    );
                  }
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
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: audiolist.length,
                        itemBuilder: (BuildContext context, int index) {
                          var audio = audiolist[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailPage(audio: audio,);
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
                                    MediaQuery.sizeOf(context).height * 0.2,
                                    width:
                                    MediaQuery.sizeOf(context).width * 0.4,
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
        ],
      ),
    );
  }
}
