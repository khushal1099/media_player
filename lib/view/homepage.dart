import 'package:flutter/material.dart';
import 'package:media_player/view/firstpage.dart';
import 'package:media_player/view/video_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pg = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Media Player",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          pg.animateToPage(
            value,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: "Song",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video_sharp),
            label: "Videos",
          ),
        ],
        selectedItemColor: Colors.purple,
      ),
      body: PageView(
        controller: pg,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        physics: NeverScrollableScrollPhysics(),
        children: [
          FirstPage(),
          VideoPage(),
        ],
      ),
    );
  }
}
