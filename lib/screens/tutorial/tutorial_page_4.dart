import 'package:flutter/material.dart';

class TutorialPage4 extends StatelessWidget {
  const TutorialPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Icon(Icons.thumb_up, color: Colors.green, size: 90),
          SizedBox(height: 20),
          Text(
            '그리고 행운을 빌어드려요!',
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }
}
