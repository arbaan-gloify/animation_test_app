import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBuilders extends StatefulWidget {
  const AnimatedBuilders({super.key});

  @override
  State<AnimatedBuilders> createState() => _AnimatedBuildersState();
}

class _AnimatedBuildersState extends State<AnimatedBuilders>
   with SingleTickerProviderStateMixin {
 late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 5),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          child: const FlutterLogo(
            size: 200,
          ),
          builder: (context, Widget? child) {
            return Transform.rotate(
              angle: animationController.value * 2.0 * math.pi,
            child: child,
            );
          },
        ),
      ),
    );
  }
}
