import 'package:flutter/material.dart';

class SortedListPage extends StatefulWidget {
  const SortedListPage({super.key});

  @override
  _SortedListPageState createState() => _SortedListPageState();
}

class _SortedListPageState extends State<SortedListPage> {
  List<int> _items = [1, 2, 3, 4, 5];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void _addItem() {
    int newItem = _items.length + 1;

    // Find the position to insert the new item
    int insertIndex = _items.indexWhere((item) => newItem < item);

    if (insertIndex == -1) {
      insertIndex = _items.length;
    }

    // Insert the new item into the list
    _items.insert(insertIndex, newItem);

    // Animate the insertion of the new item
    _listKey.currentState
        ?.insertItem(insertIndex, duration: const Duration(milliseconds: 500));
  }

  void _removeItem(int index) {
    // Remove the item from the list
    int removedItem = _items.removeAt(index);

    // Animate the removal of the item
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => ListTile(
        title: Text('$removedItem'),
        trailing: const Icon(Icons.delete),
        key: Key('$removedItem'),
        // animation: animation,
      ),
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorted List'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: ListTile(
              title: Text('${_items[index]}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _removeItem(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addItem,
      ),
    );
  }
}
