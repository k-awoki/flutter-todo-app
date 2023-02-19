import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/list/controllers/list_controller.dart';
import 'package:todo/features/list/models/list_output_model.dart';
import 'package:todo/services/db/tasks/tasks_table.dart';

class ListCell extends ConsumerWidget {
  const ListCell({
    super.key,
    required this.taskId,
  });

  final int taskId;

  Color _handlePriorityColor(Priority priority) {
    switch (priority) {
      case Priority.low:
        return Colors.blue.shade300;
      case Priority.middle:
        return Colors.yellow.shade300;
      case Priority.high:
        return Colors.red.shade300;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(listController);
    // TODO: 暫定対応(model側にIDチェックのロジック持たせる)
    final task = ref.watch(listOutputModel.select((tasks) {
      return tasks.value?.firstWhere((task) => task.id == taskId);
    }));

    return SizedBox(
      height: 60,
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 8,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Checkbox(
                    value: task?.isCompleted ?? false,
                    onChanged: (isChecked) {
                      if (isChecked == null) {
                        return;
                      }
                      controller.onPressedCheckButton(taskId, isChecked);
                    },
                  ),
                  Text(task?.title ?? 'タイトルなし'),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: 32,
              decoration: BoxDecoration(
                color: _handlePriorityColor(task?.priority ?? Priority.middle),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
