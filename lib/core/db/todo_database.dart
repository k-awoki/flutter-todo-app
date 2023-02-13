import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'todo_database.g.dart';

enum Priority {
  low,
  middle,
  high,
}

// タスクテーブル
class Tasks extends Table {
  // タスクID
  IntColumn get id => integer().autoIncrement()();
  // タスク名
  TextColumn get title => text().withLength(max: 50)();
  // タスク内容
  TextColumn get content => text()();
  // 優先度
  IntColumn get priority => intEnum<Priority>()();
  // 期限
  // DateTimeColumn get limitOn => dateTime().nullable()();
  // 作成日時
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  // 更新日時
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// Todo Database
@DriftDatabase(tables: [
  Tasks,
])
class TodoDatabase extends _$TodoDatabase {
  TodoDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<Task>> watchEntries() {
    return select(tasks).watch();
  }

  Future<List<Task>> get getAllTasks => select(tasks).get();

  Future<void> insertTask(String title, String content, Priority priority) {
    return into(tasks).insert(
      TasksCompanion.insert(title: title, content: content, priority: priority),
      onConflict: DoUpdate(
        (old) => TasksCompanion.custom(
          id: old.id,
          title: old.title,
          content: old.content,
          createdAt: old.createdAt,
          updatedAt: old.updatedAt,
        ),
      ),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
