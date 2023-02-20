import 'dart:math';

import 'package:flutter/material.dart';

class MyList2 extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  MyList2({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  State<MyList2> createState() => _MyList2State();
}

class _MyList2State extends State<MyList2> {
  List<String> texts = [
    "Monetization",
    "Pie Chart",
    "Flag",
    "Notification",
    "Savings",
    "Cloud",
    "Nightlight",
    "Assignment",
    "Location",
    "Settings",
    "Rocket",
    "Backpack",
    "Person",
    "Done All",
    "Search",
    "Extension",
    "Bluetooth",
    "Favorite",
    "Lock",
    "Bookmark",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AppBarScreen',
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ShaderMask(
          shaderCallback: (Rect rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple,
                Colors.transparent,
                Colors.transparent,
                Colors.purple
              ],
              stops: [0.0, 0.4, 1.9, 1.0],
            ).createShader(rect);
          },
          blendMode: BlendMode.dstOut,
          child: ListWheelScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            // squeeze: 2,
            // magnification: 1,
            // useMagnifier: true,
            // offAxisFraction: -1.5,
            diameterRatio: 2,
            itemExtent: 200,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              _buildCard(0),
              _buildCard(1),
              _buildCard(2),
              _buildCard(3),
              _buildCard(4),
              _buildCard(5),
              _buildCard(6),
              _buildCard(7),
              _buildCard(8),
              _buildCard(9),
              _buildCard(10),
              _buildCard(11),
              _buildCard(12),
              _buildCard(13),
              _buildCard(14),
              _buildCard(15),
              _buildCard(16),
              _buildCard(17),
              _buildCard(18),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCard(int index) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          "${index + 1}. ${texts[index]}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
