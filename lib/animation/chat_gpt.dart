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



class LeaderboardItem {
  final String name;
  final int score;

  LeaderboardItem({required this.name, required this.score});
}

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final List<LeaderboardItem> _leaderboard = [
    LeaderboardItem(name: 'Player 1', score: 100),
    LeaderboardItem(name: 'Player 2', score: 90),
    LeaderboardItem(name: 'Player 3', score: 80),
    LeaderboardItem(name: 'Player 4', score: 70),
    LeaderboardItem(name: 'Player 5', score: 60),
    LeaderboardItem(name: 'Player 6', score: 50),
    LeaderboardItem(name: 'Player 7', score: 40),
    LeaderboardItem(name: 'Player 8', score: 30),
    LeaderboardItem(name: 'Player 9', score: 20),
    LeaderboardItem(name: 'Player 10', score: 10),
  ];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _leaderboard.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_leaderboard[index], animation, index);
        },
      ),
    );
  }

Widget _buildItem(LeaderboardItem item, Animation<double> animation, int index) {
  final topThree = index < 3;
  final bgColor = topThree ? Colors.amber : null;
  final rankStyle = topThree ? const TextStyle(color: Colors.white) : null;
  final nameStyle = topThree ? const TextStyle(fontWeight: FontWeight.bold, color: Colors.black) : null;

  return SizeTransition(
    sizeFactor: animation,
    child: Card(
      elevation: 4,
      color: bgColor,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: topThree ? Colors.white : null,
          child: Text('${index + 1}', style: rankStyle),
        ),
        title: Text(item.name, style: nameStyle),
        trailing: Text('${item.score}', style: nameStyle),
      ),
    ),
  );
}

}
