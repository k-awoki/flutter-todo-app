import 'package:flutter/material.dart';
import 'package:todo/core/db/todo_database.dart';
import 'package:todo/features/list/list_page.dart';

void main() {
  final TodoDatabase database = TodoDatabase();
  runApp(TodoApp(
    database: database,
  ));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key, required this.database});

  final TodoDatabase database;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(
        database: database,
      ),
    );
  }
}
