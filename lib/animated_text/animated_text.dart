import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AllInOne extends StatefulWidget {
  const AllInOne({super.key});

  @override
  State<AllInOne> createState() => _AllInOneState();
}

class _AllInOneState extends State<AllInOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Routing Page'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            GestureDetector(
              child: Container(
                width: double.infinity,
              ),

            )
          ]),
        ),
      ),
    );
  }
}
