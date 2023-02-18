import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/register/controllers/register_controller.dart';
import 'package:todo/features/register/models/register_output_model.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(registerController.notifier);
    // final model = ref.watch(registerOutputModel);

    return Scaffold(
      appBar: AppBar(title: const Text('Registor')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('タスク名'),
                TextField(
                  onChanged: (text) => controller.inputTitleTextFeild(text),
                  maxLength: 50,
                  maxLines: 1,
                ),
                const Text('タスク内容'),
                TextField(
                  onChanged: (text) => controller.inputContentTextFeild(text),
                  maxLines: 1,
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    controller.onPressedRegisterButton();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('登録'),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
