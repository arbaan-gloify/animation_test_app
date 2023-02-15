import 'package:flutter/material.dart';

class AnimationRotationss extends StatefulWidget {
  const AnimationRotationss({super.key});

  @override
  State<AnimationRotationss> createState() => _AnimationRotationssState();
}

class _AnimationRotationssState extends State<AnimationRotationss> {
  double _turn = 0.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: AnimatedRotation(
                turns: _turn,
                duration: const Duration(seconds: 2),
                child: const FlutterLogo(
                  size: 150,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _turn += 2 / 4;
                  });
                },
                child: const Text('Rotate'))
          ]),
        ),
      ),
    );
  }
}
