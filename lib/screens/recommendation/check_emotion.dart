import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckEmotion extends StatefulWidget {
  const CheckEmotion({super.key});

  @override
  _CheckEmotionState createState() => _CheckEmotionState();
}

class _CheckEmotionState extends State<CheckEmotion> {
  double _sliderValue = 0.5;

  void _onSliderChangeEnd(double value) {
    print('$value'); //db 참고용
    context.go('/recommendation/select_emoji');
  }

  //기본 디자인 탬플릿 용도로 사용

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201D1D),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
              child: Column(
                children: [
                  Text(
                    '기분을 드래그해 \n선택해주세요! 1/2',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'GowunBatang',
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    indent: 40.0,
                    endIndent: 40.0,
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: const Color(0xFF75A8FF),
                      size: 50.0,
                    ),
                    Icon(
                      Icons.sentiment_neutral,
                      color: Colors.grey,
                      size: 50.0,
                    ),
                    Icon(
                      Icons.sentiment_satisfied,
                      color: const Color(0xFFFFC1C1),
                      size: 50.0,
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Slider(
                  value: _sliderValue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  onChangeEnd: _onSliderChangeEnd,
                  activeColor: Colors.grey,
                  inactiveColor: Colors.grey,
                  thumbColor: Colors.white,
                ),
              ],
            ),
          ),

          // Bottom spacer
          const SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
