import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MemberMain extends StatelessWidget {
  const MemberMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the My Page!',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/'); // 메인 화면으로 이동
              },
              child: const Text('Go Back'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/my/login'); // 로그인 페이지로 이동
              },
              child: const Text('Go to Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/my/settings'); // 알람 설정 페이지로 이동
              },
              child: const Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
