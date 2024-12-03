import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'tutorial_page_1.dart';
import 'tutorial_page_2.dart';
import 'tutorial_page_3.dart';
import 'tutorial_page_4.dart';
import '../main_page.dart';

class TutorialMain extends StatefulWidget {
  const TutorialMain({super.key});

  @override
  State<TutorialMain> createState() {
    return _TutorialMainState();
  }
}

class _TutorialMainState extends State<TutorialMain> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> _completeTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenTutorial', true); // 튜토리얼 완료 상태 저장
    GoRouter.of(context)
        .go('/recommendation'); // GoRouter를 사용해 recommendation 경로로 이동
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              TutorialPage1(),
              TutorialPage2(),
              TutorialPage3(),
              TutorialPage4(),
            ],
          ),
          // 페이지 인디케이터
          Positioned(
            top: MediaQuery.of(context).size.height * 0.6,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (int index) {
                  return Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.white : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
          ),
          // "다음"/"시작하기" 버튼
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < 3) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    _completeTutorial(); // 튜토리얼 완료 처리
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF373333),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(_currentPage < 3 ? "다음" : "시작하기"),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: null,
    );
  }
}
