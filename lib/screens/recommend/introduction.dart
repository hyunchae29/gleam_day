import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//todo JH: TopAppBar는 다른 파일로 분리
// 공통 위젯으로 빼는 방향이 정당한가? 고민 필요성 있음
class TopAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int initialIndex;

  const TopAppBar({
    Key? key,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateCurrentIndex();
    });
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void _updateCurrentIndex() {
    String currentPath = GoRouterState.of(context).uri.toString();
    if (currentPath == '/home') {
      currentIndex = 0;
    } else if (currentPath == '/home/recommendation') {
      currentIndex = 1;
    } else if (currentPath == '/home/history') {
      currentIndex = 2;
    } else if (currentPath == '/home/fortune') {
      currentIndex = 3;
    }
  }

  void onMenuTap(int index) {
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 0:
        context.go('/home');
        _updateCurrentIndex();
        break;
      case 1:
        context.go('/home/recommendation');
        _updateCurrentIndex();
        break;
      case 2:
        context.go('/home/history');
        _updateCurrentIndex();
        break;
      case 3:
        context.go('/home/fortune');
        _updateCurrentIndex();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuTitles = ['홈', '추천', '과거의 오늘', '포춘쿠키'];

    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      title: Text(
        'Gleam Day',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(menuTitles.length, (index) {
            final isSelected = index == currentIndex;
            return GestureDetector(
              onTap: () => onMenuTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    menuTitles[index],
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 2,
                      width: 20,
                      color: Colors.black,
                    ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(initialIndex: 0),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 5),
        children: [
          buildImageCard(
            context,
            'assets/images/1.png',
            '주얼리를 추천',
            '오늘 하루에 어울리는 주얼리를 추천해드려요',
          ),
          buildImageCard(
            context,
            'assets/images/2.png',
            '이모지를 선택',
            '100가지 이상의 옵션 중 오늘에 맞는 것을 선택해주세요',
          ),
          buildImageCard(
            context,
            'assets/images/3.png',
            '수많은 종류',
            '다양한 보석들과 조합해드려요',
          ),
          buildImageCard(
            context,
            'assets/images/4.png',
            '오직 당신만을 위한 추천',
            '당신의 소중한 하루를 위해 찾아드려요',
          ),
        ],
      ),
    );
  }

  Widget buildImageCard(BuildContext context, String imagePath, String title,
      String description) {
    return Card(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          //borderRadius: BorderRadius.circular(15),
          ),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
