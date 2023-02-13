import 'package:flutter/material.dart';
import 'package:todo/core/db/todo_database.dart';
import 'package:todo/features/list/list_cell.dart';
import 'package:todo/features/register/register_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.database});

  final TodoDatabase database;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: StreamBuilder(
          stream: widget.database.watchEntries(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              // TODO: タスク未登録時の分岐処理を追加する
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Flexible(
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: ((context, index) {
                      return ListCell(
                          taskText: snapshot.data?[index].title ?? 'データがありません');
                    }),
                  ),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RegisterPage(database: widget.database),
                fullscreenDialog: true),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
