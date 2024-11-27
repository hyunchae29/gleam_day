import 'package:flutter/material.dart';

class LockSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('잠금 설정'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: const Text(
          'PIN 입력 화면',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
