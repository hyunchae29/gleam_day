import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/recommendation'); // 첫 번째 메뉴 페이지로 이동
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF201D1D), // 배경색 설정
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: _showFirstPage
                      ? _buildFirstPage(context)
                      : _buildSecondPage(context),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Image.asset(
                  'assets/icon_ring.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: null,
      ),
    );
  }

  Widget _buildFirstPage(BuildContext context) {
    return Column(
      key: const ValueKey(1),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'How\ndo you\nfeel\ntoday?',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 72,
            fontFamily: 'YujiMai',
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSecondPage(BuildContext context) {
    return Column(
      key: const ValueKey(2),
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          '오늘은\n어떤 날\n인가요?',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 72,
            fontFamily: 'GowunBatang',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
