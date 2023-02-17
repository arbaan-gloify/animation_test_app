

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListPages extends StatefulWidget {
  const ListPages({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListPagesState createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _offsetAnimation = List.generate(
      growable: true,
      2,
      (index) => Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: Offset(index == 0 ? 1 : -1, 0),
      ).animate(_controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _animate() {
    _controller.status == AnimationStatus.completed
        ? _controller.reverse()
        : _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Demo Row Animation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BoxWidget(
                  callBack: _animate,
                  text: "1",
                  color: Colors.red,
                  position: _offsetAnimation[0],
                ),
                BoxWidget(
                  callBack: _animate,
                  text: "2",
                  color: Colors.blue,
                  position: _offsetAnimation[1],
                ),
                // BoxWidget(
                //   callBack: _animate,
                //   text: "3",
                //   color: Colors.green,
                //   position: _offsetAnimation[1],
                // ),
                // BoxWidget(
                //   callBack: _animate,
                //   text: "4",
                //   color: Colors.purple,
                //   position: _offsetAnimation[0],
                // ),
              ],
            ),
            ElevatedButton(
              onPressed: _animate,
              child: const Text("Swap"),
            )
          ],
        ),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final Animation<Offset> position;
  final Function callBack;
  final String text;
  final Color color;

  const BoxWidget(
      {super.key,  required this.position, required this.callBack, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: position,
      child: GestureDetector(
        onTap: () => callBack(),
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          width: 50,
          color: color,
          child: Center(
            child: Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}