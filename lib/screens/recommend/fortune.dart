import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../recommend/introduction.dart';

class Fortune extends StatefulWidget {
  const Fortune({Key? key}) : super(key: key);

  @override
  State<Fortune> createState() => _EmojiMainState();
}

class _EmojiMainState extends State<Fortune> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(initialIndex: 3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Fortune Page!',
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
