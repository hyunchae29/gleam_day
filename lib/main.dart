import 'package:flutter/material.dart';
import 'screens/tutorial/tutorial_main.dart';

void main() {
  runApp(const GleamDayApp());
}

class GleamDayApp extends StatelessWidget {
  const GleamDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gleam Day',
      theme: ThemeData(
        brightness: Brightness.dark, // 다크 테마 적용
        scaffoldBackgroundColor: const Color(0xFF201D1D), // 배경색 설정
        fontFamily: 'YujiMai', // 기본 영어 폰트
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 20,
            fontFamilyFallback: ['GowunBatang'], // 한국어 대체 폰트
            color: Colors.white, // 글자 색상
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            fontFamilyFallback: ['GowunBatang'],
            color: Colors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            fontFamilyFallback: ['GowunBatang'],
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const TutorialMain(), // 튜토리얼 메인 화면
    );
  }
}