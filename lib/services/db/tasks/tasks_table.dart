import 'package:drift/drift.dart';

enum Priority {
  low,
  middle,
  high,
}

class Tasks extends Table {
  // タスクID
  IntColumn get id => integer().autoIncrement()();
  // タスク名
  TextColumn get title => text().withLength(max: 50)();
  // タスク内容
  TextColumn get content => text()();
  // タスク完了済みか
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  // 優先度
  IntColumn get priority => intEnum<Priority>()();
  // 期限
  // DateTimeColumn get limitOn => dateTime().nullable()();
  // 作成日時
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  // 更新日時
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
