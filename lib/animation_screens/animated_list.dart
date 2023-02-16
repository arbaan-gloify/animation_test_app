import 'package:flutter/material.dart';
import 'dart:math' as math show Random;

class AnimatedListss extends StatefulWidget {
  const AnimatedListss({Key? key}) : super(key: key);

  @override
  State<AnimatedListss> createState() => _AnimatedListssState();
}

class _AnimatedListssState extends State<AnimatedListss> {
  final _items = ["Item 0"];

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, "Item ${_items.length + 1}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _removeItem(int index, BuildContext context) {
    AnimatedList.of(context).removeItem(index, (_, animation) {
      return FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: SizedBox(
            height: 100,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 20),
              elevation: 10,
              color: Colors.red[400],
              child: const Center(
                child: Text("I am going away",
                    style:  TextStyle(fontSize: 28)),
              ),
            ),
          ),
        ),
      );
    }, duration: const Duration(seconds: 1));

    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.plus_one_outlined),
          )
        ],
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: 1,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            key: UniqueKey(),
            position: Tween<Offset>(
              begin: const Offset(-2, -0.5),
              end: const Offset(0, 0),
            ).animate(animation),
            child: RotationTransition(
              turns: animation,
              child: SizeTransition(
                axis: Axis.vertical,
                sizeFactor: animation,
                child: SizedBox(
                  height: 100,
                  child: InkWell(
                    onTap: () => _removeItem(index, context),
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      elevation: 10,
                      color: Colors.primaries[
                          math.Random().nextInt(Colors.primaries.length)],
                      child: Center(
                        child: Text(_items[index],
                            style: const TextStyle(fontSize: 28)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
