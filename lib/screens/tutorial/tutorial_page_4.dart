import 'package:flutter/material.dart';

class TutorialPage4 extends StatelessWidget {
  const TutorialPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.thumb_up, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            '그리고 행운을 빌어드려요!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}