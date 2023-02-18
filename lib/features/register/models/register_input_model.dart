import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/services/db/tasks/tasks_table.dart';
import 'package:todo/services/db/todo_database_provider.dart';

final registerInputModel = Provider.autoDispose((ref) {
  return _RegisterInputModel(ref);
});

class _RegisterInputModel {
  _RegisterInputModel(this.ref);

  final Ref ref;

  void add(String title, String content, Priority priority) {
    ref.read(databaseProvider).taskDao.add(
          title,
          content,
          priority,
        );
  }
}
