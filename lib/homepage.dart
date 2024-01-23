import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RangeValues minutes = RangeValues(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Media Player",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 30),
        ),
        centerTitle: true,
        elevation: 0,
      ),
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
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
              Center(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/images/lutputgya img.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(21),
                    child: Text(
                      "Lutt Putt Gaya",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        size: 25,
                      ),
                      color: Colors.white,
                    ),
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
              RangeSlider(
                inactiveColor: Colors.grey,
                activeColor: Colors.white,
                values: minutes,
                onChanged: (value) {
                  minutes = value;
                },
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "0:00",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 310),
                    child: Text(
                      "0:00",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.repeat,size: 30,color: Colors.white,),),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.skip_previous,size: 35,color: Colors.white,),),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.play_arrow_rounded,size: 55,color: Colors.white,),),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.skip_next,size: 35,color: Colors.white,),),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.add,size: 35,color: Colors.white,),),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
