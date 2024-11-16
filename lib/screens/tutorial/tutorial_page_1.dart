import 'package:flutter/material.dart';

class TutorialPage1 extends StatelessWidget {
  const TutorialPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 2), // 위쪽 여백
        Icon(
          Icons.favorite,
          color: Colors.pink,
          size: 100, // 튜토리얼 1번 아이콘 크기로 통일
        ),
        SizedBox(height: 20),
        Text(
          '매일매일 주얼리를 추천해드려요!',
        ),
        Spacer(flex: 3), // 아래쪽 여백
      ],
    );
  }
}