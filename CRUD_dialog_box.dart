
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CrudApp(),
    );
  }
}

class CrudApp extends StatefulWidget {
  @override
  _CrudAppState createState() => _CrudAppState();
}

class _CrudAppState extends State<CrudApp> {
  List<String> items = [];
  String searchQuery = '';
  final TextEditingController _controller = TextEditingController();

  void _addItem(String item) {
    setState(() {
      items.add(item);
    });
  }

  void _updateItem(int index, String newItem) {
    setState(() {
      items[index] = newItem;
    });
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void _searchItem(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filter items based on search query
    List<String> filteredItems = items
        .where((item) => item.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter CRUD with Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Field
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: _searchItem,
            ),
            SizedBox(height: 10),
            
            // Add Item Button
            ElevatedButton(
              onPressed: () {
                _addItem('Item ${items.length + 1}');
              },
              child: Text('Add Item'),
            ),
            SizedBox(height: 10),
            
            // List View to display filtered items
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredItems[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Update Button
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showEditDialog(index, filteredItems[index]);
                          },
                        ),
                        // Delete Button
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteItem(items.indexOf(filteredItems[index]));
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(int index, String currentItem) {
    TextEditingController editController = TextEditingController(text: currentItem);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(labelText: 'Item'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _updateItem(index, editController.text);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
