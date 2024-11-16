import 'package:flutter/material.dart';

class TutorialPage2 extends StatelessWidget {
  const TutorialPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.emoji_emotions, size: 100, color: Colors.yellow),
          SizedBox(height: 20),
          Text(
            '기분과 오늘의 상징을 체크하시면\n그에 맞는 주얼리를 추천해드려요!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}