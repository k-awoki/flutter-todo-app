import 'package:flutter/material.dart';
import 'package:todo/features/list/list_cell.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String _text = '';
  final List<String> _tasks = [];

  void _handleText(String text) {
    _text = text;
  }

  void _handleButtonTapped() {
    setState(() {
      _tasks.add(_text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Flexible(child: TextField(onChanged: _handleText)),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: _handleButtonTapped,
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  child: const Text('登録'),
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: ((context, index) {
                  return ListCell(taskText: _tasks[index]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
