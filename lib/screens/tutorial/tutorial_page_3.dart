import 'package:flutter/material.dart';

class TutorialPage3 extends StatelessWidget {
  const TutorialPage3({super.key});

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
              Icon(Icons.calendar_today, color: Colors.green, size: 90),
              Icon(Icons.bookmark, color: Colors.purple, size: 90),
              Icon(Icons.notifications, color: Colors.red, size: 90),
            ],
          ),
          SizedBox(height: 20),
          Text(
            '메모하고 저장할 수 있어요!',
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }
}