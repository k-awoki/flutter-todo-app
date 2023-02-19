import 'package:drift/drift.dart';
import 'package:todo/services/db/tasks/tasks_table.dart';
import 'package:todo/services/db/todo_database.dart';

part 'tasks_dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TaskDao extends DatabaseAccessor<TodoDatabase> with _$TaskDaoMixin {
  TaskDao(TodoDatabase db) : super(db);

  Future<List<Task>> fetchAll() {
    return select(tasks).get();
  }

  SingleSelectable<Task> fetch(int id) {
    return select(tasks)..where((task) => tasks.id.equals(id));
  }

  Future<int> add(TasksCompanion task) {
    return into(tasks).insert(task);
  }

  Future<void> renew(Task task) {
    return update(tasks).replace(task);
  }

  Stream<List<Task>> watch() {
    return (select(tasks)).watch();
  }
}
