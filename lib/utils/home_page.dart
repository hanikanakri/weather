import 'package:flutter/material.dart';
import 'package:weather/model/clip_path.dart';
import 'package:weather/model/text_style.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('My location'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.transparent,
                      width: size.width * 0.95,
                      height: size.height * 0.25,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              child: const Text(
                                '25',
                                style: TextStyle(
                                    fontSize: 150, color: Colors.white),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: RotatedBox(
                              quarterTurns: 45,
                              child: Text(
                                'weather state',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                width: size.width,
                height: 200.0,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Container(
                      height: 2,
                      width: size.width * 0.09,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text(
                      'Weather Today',
                      style: kNormalTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Column(),
                          Column(),
                          Column(),
                          Column(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Image.asset('assets/images/2.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
