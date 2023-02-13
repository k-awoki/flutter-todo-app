import 'package:flutter/material.dart';
import 'package:todo/core/db/todo_database.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.database});

  final TodoDatabase database;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _titleText = '';
  String _contentText = '';

  void _handleTitleText(String text) {
    _titleText = text;
  }

  void _handleContentText(String text) {
    _contentText = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registor')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('タスク名'),
                TextField(
                  onChanged: _handleTitleText,
                  maxLength: 50,
                  maxLines: 1,
                ),
                const Text('タスク内容'),
                TextField(onChanged: _handleContentText, maxLines: 1),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    widget.database
                        .insertTask(_titleText, _contentText, Priority.middle)
                        .then((value) => Navigator.pop(context));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('登録'),
                ),
                const Spacer(),
              ],
            ),
          ),
          StreamBuilder(
            stream: widget.database.watchEntries(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                // TODO: 登録完了ダイアログ出すようにする
                return const Spacer();
              }
            },
          ),
        ],
      ),
    );
  }
}
