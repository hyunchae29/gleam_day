import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessageDialog extends StatelessWidget {
  const MessageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '추천 페이지로 이동할까요?',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // 다이얼로그 닫기
            context.go('/home/recommendation');
          },
          child: const Text("예"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // 다이얼로그 닫기
          },
          child: const Text("아니요"),
        ),
      ],
    );
  }
}

Future<void> showMessageDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const MessageDialog(),
  );
}
