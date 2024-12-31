import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ItemSelectionList(),
    );
  }
}

class ItemSelectionList extends StatefulWidget {
  @override
  _ItemSelectionListState createState() => _ItemSelectionListState();
}

class _ItemSelectionListState extends State<ItemSelectionList> {
  // Sample list of items
  final List<String> items = [
    "Item1",
    "Item2",
    "Item3",
    "Item4",
    "Item5",
    "Item6"
  ];

  // Track selected items
  final List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Selection List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = selectedItems.contains(item);

          return ListTile(
            title: Text(item),
            trailing: isSelected
                ? Icon(Icons.check_circle, color: Colors.green)
                : Icon(Icons.check_circle_outline),
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedItems.remove(item);
                } else {
                  selectedItems.add(item);
                }
              });
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey[200],
        child: Text(
          'Selected Items: ${selectedItems.join(", ")}',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
