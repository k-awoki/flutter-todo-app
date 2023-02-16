import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/core/db/todo_database.dart';

part 'task.freezed.dart';

final tasksProvider = StateNotifierProvider<TasksNotifier, List<Task>>(
  (ref) => TasksNotifier(),
);

class TasksNotifier extends StateNotifier<List<Task>> {
  TasksNotifier() : super([]);
}

@freezed
class Task with _$Task {
  factory Task({
    required int id,
    required String title,
    required String content,
    required Bool isCompleted,
    required Priority priority,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Task;

  Task._();
}
