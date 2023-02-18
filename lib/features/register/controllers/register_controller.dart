import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/services/db/tasks/tasks_table.dart';
import 'package:todo/services/db/todo_database_provider.dart';

part 'register_controller.freezed.dart';

@freezed
class RegisterControllerState with _$RegisterControllerState {
  factory RegisterControllerState({
    @Default('') String title,
    @Default('') String content,
    @Default(Priority.middle) Priority priority,
  }) = _RegisterControllerState;
}

class RegisterControllerNotifier
    extends StateNotifier<RegisterControllerState> {
  RegisterControllerNotifier(this.ref) : super(RegisterControllerState());

  final Ref ref;

  void inputTitleTextFeild(String title) {
    // TODO: ここfreezedらしい代入方法を探す
    state = RegisterControllerState(
      title: title,
      content: state.content,
      priority: state.priority,
    );
  }

  void inputContentTextFeild(String content) {
    state = RegisterControllerState(
      title: state.title,
      content: content,
      priority: state.priority,
    );
  }

  Future<void> onPressedRegisterButton() {
    return ref.read(databaseProvider).taskDao.add(
          state.title,
          state.content,
          state.priority,
        );
  }
}

final registerController =
    StateNotifierProvider<RegisterControllerNotifier, RegisterControllerState>(
  (ref) {
    return RegisterControllerNotifier(ref);
  },
);
