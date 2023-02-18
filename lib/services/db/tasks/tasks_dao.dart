import 'package:drift/drift.dart';
import 'package:todo/services/db/todo_database.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TaskDao extends DatabaseAccessor<TodoDatabase> with _$TaskDaoMixin {
  TaskDao(TodoDatabase db) : super(db);

  Future<List<Task>> fetchAll() {
    return select(tasks).get();
  }

  Future<void> add(String title, String content, priority) {
    return into(tasks).insert(
      TasksCompanion.insert(title: title, content: content, priority: priority),
    );
  }

  Stream<List<Task>> watch() {
    return (select(tasks)).watch();
  }
}
