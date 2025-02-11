import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../recommend/introduction.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _EmojiMainState();
}

class _EmojiMainState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(initialIndex: 2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'History Page!',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
