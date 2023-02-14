import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  factory Task({
    required String title,
    required String content,
  }) = _Task;

  Task._();
}
