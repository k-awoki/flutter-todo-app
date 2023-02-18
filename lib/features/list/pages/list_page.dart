import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/list/models/list_output_model.dart';
import 'package:todo/features/list/pages/list_cell.dart';
import 'package:todo/features/register/pages/register_page.dart';

class ListPage extends ConsumerWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(listOutputModel);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: model.when(
        error: (error, _) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
                return ListCell(taskId: data[index].id);
              }),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 遷移方法再検討
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
