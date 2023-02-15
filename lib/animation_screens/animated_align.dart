import 'package:flutter/material.dart';
import 'dart:math';

class AnimationAlign extends StatefulWidget {
  const AnimationAlign({super.key});

  @override
  State<AnimationAlign> createState() => _AnimationAlignState();
}

class _AnimationAlignState extends State<AnimationAlign>
    with TickerProviderStateMixin {
  var selected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.amber,
                  child: AnimatedAlign(
                      alignment:
                          selected ? Alignment.bottomLeft : Alignment.topRight,
                      duration: const Duration(seconds: 1),
                      onEnd: () {
                        return activate();
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                          borderRadius: selected
                              ? BorderRadius.circular(0)
                              : BorderRadius.circular(100),
                        ),
                      )),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: const Text('press me '),
            ),
          ],
        ),
      ),
    ));
  }
}
