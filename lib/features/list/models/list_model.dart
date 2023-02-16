import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/db/todo_database_provider.dart';

final tasksModel = StreamProvider.autoDispose((ref) {
  return ref.watch(databaseProvider).taskDao.watch();
});
