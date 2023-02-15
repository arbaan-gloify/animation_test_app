import 'package:flutter/material.dart';

class AnimatedContainers extends StatefulWidget {
  const AnimatedContainers({super.key});

  @override
  State<AnimatedContainers> createState() => _AnimatedContainersState();
}

class _AnimatedContainersState extends State<AnimatedContainers>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  );
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: AnimatedContainer(
            width: selected ? 200 : 100,
            height: selected ? 100 : 200,
            color: Colors.amber,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
