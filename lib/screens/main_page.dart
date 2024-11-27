import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gleam_day/screens/tutorial/tutorial_main.dart';
import 'package:gleam_day/screens/see_more/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _showFirstPage = true;

  @override
  void initState() {
    super.initState();
    _startAutoSwitch();
  }

  void _startAutoSwitch() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showFirstPage = !_showFirstPage;
        });
        _startAutoSwitch();
      }
    });
  }

  Future<void> _goBackToTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenTutorial', false); // 튜토리얼 완료 상태 초기화
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const TutorialMain(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF201D1D), // 배경색 설정
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: _showFirstPage
                    ? _buildFirstPage(context)
                    : _buildSecondPage(context),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: _goBackToTutorial, // 튜토리얼로 돌아가기 버튼 동작
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Text('튜토리얼로 돌아가기'),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Image.asset(
                'assets/icon_ring.png',
                width: 100,
                height: 100,
              ),
            ),
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstPage(BuildContext context) {
    return Column(
      key: ValueKey(1),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // 가운데 정렬
      children: [
        Text(
          'How\ndo you\nfeel\ntoday?',
          textAlign: TextAlign.left, // 텍스트 내부 중앙 정렬
          style: TextStyle(
            fontSize: 72, // 글씨 크기
            fontFamily: 'YujiMai',
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSecondPage(BuildContext context) {
    return Column(
      key: ValueKey(2),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // 가운데 정렬
      children: [
        Text(
          '오늘은\n어떤 날\n인가요?',
          textAlign: TextAlign.left, // 텍스트 내부 중앙 정렬
          style: TextStyle(
            fontSize: 72, // 글씨 크기
            fontFamily: 'GowunBatang',
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: const Color(0xFF201D1D),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_outline,
                color: Colors.white,
                size: 36,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
