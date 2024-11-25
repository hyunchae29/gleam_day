import 'package:flutter/material.dart';

class TutorialPage1 extends StatelessWidget {
  const TutorialPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        Image.asset(
          'assets/icon_ring.png',
          width: 100,
          height: 100,
        ),
        SizedBox(height: 20),
        Text(
          '매일매일 주얼리를 추천해드려요!',
        ),
        Spacer(flex: 3),
      ],
    );
  }
}
