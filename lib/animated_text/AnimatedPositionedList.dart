import 'dart:developer';
import 'package:flutter/material.dart';

class AnimatedPositionedList extends StatefulWidget {
  const AnimatedPositionedList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedPositionedListState createState() => _AnimatedPositionedListState();
}

class _AnimatedPositionedListState extends State<AnimatedPositionedList> {

  List<Aa> tempList = [];

  List<double> defaultPoisitionList = [100, 170, 240, 310,380];

  List<int> indexList = [0, 1, 2, 3];

// TODO LIST OUT INITIAL VALUES
  List<Aa> pointsList = [
    Aa(id: 0, points: 100),
    Aa(id: 1, points: 200),
    Aa(id: 2, points: 300),
    Aa(id: 3, points: 400),
    Aa(id: 4, points: 600),
  ];

// TODO THE ININ STATE WILL CHANGE AS PER THE API LOADES EVERY TIME USER OPENS THE PAGE 
  @override
  void initState() {
    getNewList();
    super.initState();
  }

//TODO LIST WE WILL GET FROM API
  getNewList() {
    tempList = [
      Aa(id: 0, points: 100),
      Aa(id: 1, points: 200),
      Aa(id: 2, points: 300),
      Aa(id: 3, points: 400),
      Aa(id: 4, points: 600),
    ];

    indexList.clear();
    for (int i = 0; i < tempList.length; i++) {
      for (int j = 0; j < pointsList.length; j++) {
        if (tempList[i].id == pointsList[j].id) {
          indexList.add(j);
          break;
        }
      }
    }
    log(indexList.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListViewStack")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100 * tempList.length.toDouble(),
                  child: Stack(
                    children: [
                      for (int i = 0; i < tempList.length; i++)
                        AnimatedPositioned(
                            curve: Curves.decelerate,
                            top: defaultPoisitionList[indexList[i]],
                            width: 345,
                            height: 60,
                            duration: const Duration(seconds: 1),
                            child: Card(
                              elevation: 4,
                              color: Colors.blue.shade200,
                              child: const ListTile(
                                leading: Icon(
                                  Icons.person_3_outlined,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                title: Text("Player Names"),
                                trailing: Icon(
                                  Icons.android_sharp,
                                  size: 30,
                                  color: Colors.green,
                                ),
                              ),
                            )),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      getNewList();
                    },
                    child: const Text('click'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Aa {
  int id;
  int points;
  Aa({required this.id, required this.points});
}
