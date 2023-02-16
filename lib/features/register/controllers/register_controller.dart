import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/core/db/todo_database.dart';
import 'package:todo/core/db/todo_database_provider.dart';

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



// final registerController =
//     Provider.autoDispose((ref) => _RegisterController.new);

// class _RegisterController {
//   _RegisterController(this.ref);

//   final Ref ref;

//   void inputTitleTextFeild(String title) {}

//   void onPressedRegisterButton() {
//     ref.watch(databaseProvider).taskDao.add(title, content, priority);
//   }
// }



/// コントローラ
// class MyHomePageController extends StateNotifier<MyHomePageControllerState> {
//   MyHomePageController() : super(MyHomePageControllerState()) {
//     // 初期化中にエラーが起こってしまった！
//     state =
//         state.copyWith(counter: state.counter, exception: Exception('error'));
//   }
//   // riverpodで使うproviderはコントローラ用なのでstaticで定義
//   static final provider =
//       StateNotifierProvider((ref) => MyHomePageController());

//   void incrementCounter() {
//     state =
//         state.copyWith(counter: state.counter + 1, exception: state.exception);
//   }

//   void dismissException() {
//     state = state.copyWith(counter: state.counter, exception: null);
//   }
// }
