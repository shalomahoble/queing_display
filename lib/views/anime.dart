import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedListDemoState createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = List.generate(10, (index) => "item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated List Demo")),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], animation, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _removeItem();
        },
        child: const Icon(Icons.delete),
      ),
    );
  }

  void _removeItem() {
    final removedItem = _items.removeAt(0); // Supprimez un élément de la liste
    _listKey.currentState!.removeItem(
      0,
      (context, animation) => _buildItem(removedItem, animation, 0),
    );
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(item),
        ),
      ),
    );
  }
}
