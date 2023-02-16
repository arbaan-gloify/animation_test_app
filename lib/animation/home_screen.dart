import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width = 120;
  double _height = 140;
  double _opacity = 0.0;
  double _angle = 0.0;
  var _duration = Duration(microseconds: 200);
  late Color _color;
  late double _borderRadius;
  late double _margin;

  @override
  void initState() {
    super.initState();
    _color = _randomColor();
    _borderRadius = _randomLook();
    _margin = _randomLook();
    Future.delayed(const Duration(microseconds: 300), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  double _randomLook({int max = 80}) {
    return Random().nextDouble() * max;
  }

  Color _randomColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: _duration,
              opacity: _opacity,
              child: AnimatedContainer(
                transform: Matrix4.identity()..rotateZ(_angle),
                transformAlignment: FractionalOffset.center,
                duration: _duration,
                alignment: Alignment.center,
                width: _width,
                height: _height,
                margin: EdgeInsets.all(_margin),
                decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(_borderRadius)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _color = _randomColor();
                    _borderRadius = _randomLook();
                    _margin = _randomLook();
                  });
                },
                child: const Text('Change Look')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              setState(() {
                _width = _randomLook(max: 200);
                _height =_randomLook(max: 300);
              });
            }, child: const Text('Change size')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _angle = _randomLook(max: 200);
                  });
                }, child: const Text('Change Rotate')),
          ],
        ),
      ),
    );
  }
}
