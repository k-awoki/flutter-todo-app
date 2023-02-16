import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/list/models/list_model.dart';
import 'package:todo/features/list/pages/list_cell.dart';
import 'package:todo/features/register/register_page.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final controller = ref.read(listController);
    final model = ref.watch(tasksModel);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: model.when(
        error: (error, _) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Flexible(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return ListCell(taskText: data[index].title);
                }),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.onPressedRegister();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterPage(),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
