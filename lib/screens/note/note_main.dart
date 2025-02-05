import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoteMain extends StatefulWidget {
  const NoteMain({Key? key}) : super(key: key);

  @override
  State<NoteMain> createState() => _NoteMainState();
}

class _NoteMainState extends State<NoteMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the note Page!',
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
