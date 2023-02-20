import 'package:flutter/material.dart';

class TweenBuilders extends StatefulWidget {
  const TweenBuilders({super.key});

  @override
  State<TweenBuilders> createState() => _TweenBuildersState();
}

double _opoacity = 0;

class _TweenBuildersState extends State<TweenBuilders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            onEnd: () {
              setState(() {
                _opoacity=1;
              });
            },
            curve: Curves.bounceOut,
            duration: const Duration(seconds: 2),
            tween: Tween<double>(begin: 30, end: 100),
            builder: (context, value, child) {
              return Icon(
                Icons.flash_on,
                size: value,
                color: Colors.red,
              );
            },
          ),
          AnimatedOpacity(
            opacity: _opoacity,
            duration: const Duration(seconds: 1),
            child: const Text(
              "Tween Builder ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      )),
    ));
  }
}
