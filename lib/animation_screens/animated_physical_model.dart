import 'package:flutter/material.dart';

class AnimatedPhusicalModelss extends StatefulWidget {
  const AnimatedPhusicalModelss({super.key});

  @override
  State<AnimatedPhusicalModelss> createState() =>
      _AnimatedPhusicalModelssState();
}

class _AnimatedPhusicalModelssState extends State<AnimatedPhusicalModelss> {
  bool _bool = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedPhysicalModel(
                  curve: Curves.fastLinearToSlowEaseIn,
                  shape: BoxShape.rectangle,
                  elevation: _bool ? 0 : 10,
                  color: Colors.orange,
                  shadowColor: Colors.black,
                  duration: const Duration(seconds: 2),
                  child: const SizedBox(
                      height: 150,
                      width: 150,
                      child: Icon(Icons.access_alarm_outlined))),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _bool = !_bool;
                    });
                  },
                  child: const Text("Press me "))
            ],
          ),
        ),
      ),
    );
  }
}
