import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // SharedPreferences import
import 'screens/tutorial/tutorial_main.dart';
import 'screens/main_page.dart';

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
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _showTutorial = true;

  @override
  void initState() {
    super.initState();
    _checkTutorialStatus();
  }

  Future<void> _checkTutorialStatus() async {
    final prefs = await SharedPreferences.getInstance(); // SharedPreferences 사용
    bool hasSeenTutorial = prefs.getBool('hasSeenTutorial') ?? false;
    setState(() {
      _showTutorial = !hasSeenTutorial;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showTutorial) {
      return const TutorialMain();
    } else {
      return const MainPage();
    }
  }
}
