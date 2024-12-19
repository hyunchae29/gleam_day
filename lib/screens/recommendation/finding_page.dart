import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class FindingPage extends StatefulWidget {
  const FindingPage({super.key});

  @override
  State<FindingPage> createState() => _FindingPageState();
}

class _FindingPageState extends State<FindingPage> {
  String _loadingText = '찾는 중 입니다';
  int _dotCount = 1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // 점이 반복되는 애니메이션 타이머 설정
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount % 3) + 1; // 0, 1, 2, 3 반복
        _loadingText = '찾는 중 입니다' + '.' * _dotCount;
      });
    });

    // 일정 시간 후에 자동으로 result 페이지로 이동
    Future.delayed(const Duration(seconds: 3), () {
      _timer.cancel(); // 타이머 중지
      context.go('/recommendation/result');
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // 타이머 정리
    super.dispose();
  }

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
                    _loadingText, // 점이 반복되는 텍스트
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
                  const SizedBox(height: 20.0),
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
