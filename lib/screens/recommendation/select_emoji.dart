import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class SelectEmoji extends StatefulWidget {
  const SelectEmoji({super.key});

  @override
  State<SelectEmoji> createState() => _SelectEmojiState();
}

class _SelectEmojiState extends State<SelectEmoji> {
  final List<String> allEmojis = List.generate(
      60, (index) => 'assets/emoji/emoji_$index.png'); // 이미지 경로 리스트
  List<String> displayedEmojis = List.filled(36, ''); // 초기화된 이모지 리스트
  List<String> selectedEmojis = []; // 선택된 이모지 리스트
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _loadSelectedEmojis();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _pageController.jumpToPage(0); // 초기 페이지로 설정
      });
    });
    _pageController.addListener(() {
      setState(() {}); // 페이지 상태 변경 시 인디케이터 업데이트
    });
    _refreshEmojis();
  }

  Future<void> _loadSelectedEmojis() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmojis = prefs.getStringList('selectedEmojis') ?? [];
    final savedDisplayed = prefs.getStringList('displayedEmojis') ?? [];
    setState(() {
      selectedEmojis = savedEmojis;
      if (savedDisplayed.isNotEmpty) {
        displayedEmojis = savedDisplayed;
      } else {
        _refreshEmojis();
      }
    });
  }

  Future<void> _saveDisplayedEmojis() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('displayedEmojis', displayedEmojis);
  }

  Future<void> _saveSelectedEmojis() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedEmojis', selectedEmojis);
  }

  void _refreshEmojis() {
    final random = Random();
    setState(() {
      // 선택된 이모지는 위치를 유지하고 나머지 이모지 갱신
      final newEmojis = allEmojis
          .where((emoji) => !selectedEmojis.contains(emoji))
          .toList()
        ..shuffle(random);

      for (int i = 0; i < displayedEmojis.length; i++) {
        if (i < selectedEmojis.length) {
          displayedEmojis[i] = selectedEmojis[i];
        } else {
          displayedEmojis[i] = newEmojis.isNotEmpty
              ? newEmojis.removeLast()
              : displayedEmojis[i];
        }
      }

      // 저장된 선택 이모지를 유지
      _saveSelectedEmojis();
      _saveDisplayedEmojis();
    });
  }

  void _onEmojiTap(String emoji) {
    setState(() {
      if (selectedEmojis.contains(emoji)) {
        selectedEmojis.remove(emoji); // 이미 선택된 경우 제거
      } else if (selectedEmojis.length < 3) {
        selectedEmojis.add(emoji); // 최대 3개까지 선택
      }

      if (selectedEmojis.length == 3) {
        _showConfirmationDialog(); // 3개 선택 시 알럿 자동 호출
      }
    });
    _saveSelectedEmojis();
    _saveDisplayedEmojis();
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF201D1D),
          title: const Text(
            '이 세 가지로 할까요?',
            style: TextStyle(color: Colors.white, fontFamily: 'GowunBatang'),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: selectedEmojis
                .map((emoji) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Image.asset(
                        emoji,
                        width: 50,
                        height: 50,
                      ),
                    ))
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '취소',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다음 동작 추가 가능
              },
              child: const Text(
                '다음',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
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
                    '오늘을 3가지 체크하고\n다음을 눌러주세요! 2/2',
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
            child: PageView.builder(
              controller: _pageController,
              itemCount: 4,
              onPageChanged: (index) {
                setState(() {}); // 페이지 인덱스 변경 시 상태 갱신
              },
              itemBuilder: (context, pageIndex) {
                final pageEmojis =
                    displayedEmojis.sublist(pageIndex * 9, (pageIndex + 1) * 9);
                return GridView.builder(
                  padding: const EdgeInsets.all(20.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: pageEmojis.length,
                  itemBuilder: (context, index) {
                    final emoji = pageEmojis[index];
                    final isSelected = selectedEmojis.contains(emoji);
                    return GestureDetector(
                      onTap: () => _onEmojiTap(emoji),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Image.asset(
                            emoji,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (_pageController.hasClients &&
                            (_pageController.page?.round() ?? 0) == index)
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    context.pop(); // 뒤로가기
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  onPressed: _refreshEmojis, // 이모지 새로고침
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    context.go('/emoji/emoji_create'); // emoji_create.dart로 이동
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
