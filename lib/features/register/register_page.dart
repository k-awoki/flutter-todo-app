import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  void _tappedRegisterButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registor')),
      body: Column(
        children: [
          const TextField(),
          const SizedBox(height: 8),
          TextButton(
            onPressed: _tappedRegisterButton,
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text('登録'),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
