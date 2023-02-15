import 'package:flutter/material.dart';

class AnimatedIconss extends StatefulWidget {
  const AnimatedIconss({super.key});

  @override
  State<AnimatedIconss> createState() => _AnimatedIconsState();
}

class _AnimatedIconsState extends State<AnimatedIconss>
    with TickerProviderStateMixin {
  bool _bool = false;
  late AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
            onTap: (){
              if(_bool==false){
                _controller.forward();
              }else{
                _controller.reverse();
              }
              setState(() {
                _bool =!_bool;
              });
            },
        child: AnimatedIcon(
            icon: AnimatedIcons.arrow_menu, progress: _controller, size: 150),
      )),
    );
  }
}
