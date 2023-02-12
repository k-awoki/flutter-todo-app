import 'package:flutter/material.dart';

class ListCell extends StatelessWidget {
  final String taskText;

  const ListCell({
    super.key,
    required this.taskText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 8,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(taskText),
        ),
      ),
    );
  }
}
