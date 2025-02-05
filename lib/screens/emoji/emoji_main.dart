import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmojiMain extends StatefulWidget {
  const EmojiMain({Key? key}) : super(key: key);

  @override
  State<EmojiMain> createState() => _EmojiMainState();
}

class _EmojiMainState extends State<EmojiMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the emoji Page!',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/'); // 이전 화면으로 이동
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
