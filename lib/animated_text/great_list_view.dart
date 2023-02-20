import 'package:flutter/material.dart';
import 'package:great_list_view/great_list_view.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<ItemData> currentList;

  @override
  void initState() {
    super.initState();
    currentList = listA;
  }

  void swapList() {
    setState(() {
      if (currentList == listA) {
        currentList = listB;
      } else {
        currentList = listA;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: AutomaticAnimatedListView<ItemData>(
        list: currentList,
        comparator: AnimatedListDiffListComparator<ItemData>(
            sameItem: (a, b) => a.id == b.id,
            sameContent: (a, b) =>
                a.text == b.text &&
                a.color == b.color &&
                a.fixedHeight == b.fixedHeight),
        itemBuilder: (context, item, data) => data.measuring
            ? Container(
                margin: EdgeInsets.all(5), height: item.fixedHeight ?? 60)
            : Item(data: item),
        listController: controller,
        morphComparator: (a, b) {
          if (a is Item && b is Item) {
            return a.data.text == b.data.text &&
                a.data.color == b.data.color &&
                a.data.fixedHeight == b.data.fixedHeight;
          }
          return false;
        },
        scrollController: scrollController,
      ),
    );
  }
}

class Item extends StatelessWidget {
  final ItemData data;

  const Item({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => gkey.currentState?.swapList(),
        child: Container(
            height: data.fixedHeight ?? 60,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: data.color,
                border: Border.all(color: Colors.black12, width: 0)),
            child: Center(
                child: Text(
              data.text,
              style: TextStyle(fontSize: 16),
            ))));
  }
}

class ItemData {
  final int id;
  final String text;
  final Color color;
  final double? fixedHeight;
  const ItemData(this.text, this.id,
      [this.color = Colors.blue, this.fixedHeight]);
}

List<ItemData> listA = [
  ItemData('Text 1', 1, Colors.orange),
  ItemData('Text 2', 2),
  ItemData('Text 3', 3),
  ItemData('Text 4', 4),
  ItemData('Text 5', 5),
  ItemData('Text 8', 8, Colors.green)
];
List<ItemData> listB = [
  ItemData('Text 2', 2),
  ItemData('Text 6', 6),
  ItemData('Other text 5', 5, Colors.pink, 100),
  ItemData('Text 7', 7),
  ItemData('Other text 8', 8, Colors.yellowAccent)
];

final scrollController = ScrollController();
final controller = AnimatedListController();
final gkey = GlobalKey<_BodyState>();