import 'package:flutter/material.dart';

class ContainerSwapper extends StatefulWidget {
  const ContainerSwapper({super.key});

  @override
  _ContainerSwapperState createState() => _ContainerSwapperState();
}

class _ContainerSwapperState extends State<ContainerSwapper> {
  List<int> _containerPositions = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Swapper'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildContainer(_containerPositions[0]),
                _buildContainer(_containerPositions[1]),
                _buildContainer(_containerPositions[2]),
                _buildContainer(_containerPositions[3]),
                _buildContainer(_containerPositions[4]),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _swapContainers(1, 4);
                  _swapContainers(2, 3);
                });
              },
              child: const Text('Swap Containers'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(int containerNumber) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 100,
          width: 100,
          child: SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: const AlwaysStoppedAnimation(1),
              curve: Curves.easeInOut,
            ),
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text(containerNumber.toString()),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _swapContainers(int index1, int index2) {
    int temp = _containerPositions[index1 - 1];
    _containerPositions[index1 - 1] = _containerPositions[index2 - 1];
    _containerPositions[index2 - 1] = temp;
  }
}
