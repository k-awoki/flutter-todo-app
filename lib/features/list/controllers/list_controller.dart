import 'package:flutter_riverpod/flutter_riverpod.dart';

final listController = Provider.autoDispose((ref) {
  return _ListController(ref);
});

class _ListController {
  _ListController(this.ref);

  final Ref ref;

  void onPressedRegister() {}
}
