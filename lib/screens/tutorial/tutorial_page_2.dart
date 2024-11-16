import 'package:flutter/material.dart';

class TutorialPage2 extends StatelessWidget {
  const TutorialPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.location_city, color: Colors.blue, size: 90),
              Icon(Icons.emoji_emotions, color: Colors.orange, size: 90),
              Icon(Icons.wb_sunny, color: Colors.yellow, size: 90),
            ],
          ),
          SizedBox(height: 20),
          Text(
            '기분과 오늘의 상징을 체크하시면\n그에 맞는 주얼리를 추천해드려요!',
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }
}