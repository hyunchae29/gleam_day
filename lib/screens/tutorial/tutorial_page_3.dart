import 'package:flutter/material.dart';

class TutorialPage3 extends StatelessWidget {
  const TutorialPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.bookmark, size: 100, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            '저장하고, 기록할 수 있어요!\n알림과 잠금화면도 설정 가능!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}