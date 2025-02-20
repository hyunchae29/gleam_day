import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/note/recommend_list.dart';

class RecommendMessageDialog extends StatelessWidget {
  const RecommendMessageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("추천된 리스트 중 하나를 가져올까요?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // 다이얼로그 닫기
            context.push('/note/add_note');
          },
          child: const Text("아니요"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // 다이얼로그 닫기
            showRecommendListDialog(context);
            // Diallog 클래스 호출 필요
          },
          child: const Text("예"),
        ),
      ],
    );
  }
}

Future<void> showRecommendDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const RecommendMessageDialog(),
  );
}
