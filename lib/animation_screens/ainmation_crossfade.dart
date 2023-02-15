import 'package:flutter/material.dart';

class AnimatedCrossfades extends StatefulWidget {
  const AnimatedCrossfades({super.key});

  @override
  State<AnimatedCrossfades> createState() => _AnimatedCrossfadesState();
}

class _AnimatedCrossfadesState extends State<AnimatedCrossfades>
    with SingleTickerProviderStateMixin {
  bool selected = false;
  double _fontSize = 40;
  var _color = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              selected = !selected;
              _fontSize = selected ? 60 : 40;
              _color = selected ? Colors.blueAccent : Colors.redAccent;
            });
          },
          child: const Text('Press me to switch'),
        ),
        AnimatedCrossFade(
            firstChild: Container(
              width: double.infinity,
              height: 200,
              color: Colors.amber,
            ),
            secondChild: Container(
              width: double.infinity,
              height: 200,
              color: Colors.green,
            ),
            crossFadeState:
                selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(seconds: 2)),
        AnimatedDefaultTextStyle(
            style: TextStyle(fontSize: _fontSize, color: _color),
            duration: const Duration(milliseconds: 500),
            child: const Text('Flutter Animation')),
      ],
    ));
  }
}
