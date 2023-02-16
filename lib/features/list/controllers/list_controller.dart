import 'package:flutter_riverpod/flutter_riverpod.dart';

final listController = Provider.autoDispose((ref) => _ListController.new);

class _ListController {
  _ListController(this.ref);

  final Ref ref;

  // void onPressedRegister() {
  //   print('');
  // }
}
