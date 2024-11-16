import 'package:flutter/material.dart';
import 'tutorial_page_1.dart';
import 'tutorial_page_2.dart';
import 'tutorial_page_3.dart';
import 'tutorial_page_4.dart';

class TutorialMain extends StatefulWidget {
  const TutorialMain({super.key});

  @override
  _TutorialMainState createState() => _TutorialMainState();
}

class _TutorialMainState extends State<TutorialMain> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
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
          ),
          _buildPageIndicator(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == 3) {
                  // 튜토리얼 완료 후 다음 화면으로 이동
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(_currentPage == 3 ? '시작하기' : '다음'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 10,
          width: _currentPage == index ? 20 : 10,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.white : Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}