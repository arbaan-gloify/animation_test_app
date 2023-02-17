import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Coinss extends StatefulWidget {
  const Coinss({super.key});

  @override
  State<Coinss> createState() => _CoinssState();
}

class _CoinssState extends State<Coinss> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  AudioPlayer playe = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.3,
      duration: const Duration(seconds: 3),
    )..repeat();
    _controller.addListener(() {});
    _controller.stop();
  }

  bool repeat = false;
  bool selected = true;
  int _counter = 0;

  _incrementCounter(bool isSelected) async {
    for (int i = 0; i < 100; i++) {
      await Future.delayed(const Duration(microseconds: 10000), () {
        setState(() {
          isSelected ? _counter++ : _counter--;
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Coins Collection'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Collected Coins",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Lottie.asset('assets/coin.json',
                            controller: _controller,
                            animate: true,
                            width: 20,
                            height: 20),
                        Text('$_counter'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 4),
                    opacity: selected ? 1 : 0,
                    child: AnimatedAlign(
                      alignment: selected
                          ? Alignment.center
                          : const FractionalOffset(0.8, -0.1),
                      duration: const Duration(seconds: 5),
                      curve: Curves.fastOutSlowIn,
                      child: AnimatedContainer(
                        width: selected ? 200 : 20,
                        height: selected ? 200 : 20,
                        duration: const Duration(seconds: 3),
                        child: Lottie.asset('assets/coin.json',
                            controller: _controller,
                            animate: true,
                            width: 100,
                            height: 100),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      _incrementCounter(selected);
                      final player =AudioPlayer();
                      await player.play(AssetSource('coinsAudio.mp3'));
                      setState(() {
                        selected = !selected;
                      });
                      repeat = false;
                      _controller.forward(from: 0.1);
                    },
                    child: const Text("data"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
