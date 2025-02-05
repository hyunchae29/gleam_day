import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  int currentIndex = 0; // 현재 활성화된 메뉴 인덱스

  final menuTitles = ['홈', '추천', '과거의 오늘', '포춘 쿠키'];

  void onMenuTap(int index) {
    setState(() {
      currentIndex = index;
    });
    // TODO: 페이지 전환 로직 추가
    switch (index) {
      case 0:
        // Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
        break;
      case 1:
        // Navigator.push(context, MaterialPageRoute(builder: (_) => RecommendPage()));
        break;
      case 2:
        // Navigator.push(context, MaterialPageRoute(builder: (_) => HistoryPage()));
        break;
      case 3:
        // Navigator.push(context, MaterialPageRoute(builder: (_) => FortuneCookiePage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gleam Day',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(menuTitles.length, (index) {
              final isSelected = index == currentIndex;
              return GestureDetector(
                onTap: () => onMenuTap(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      menuTitles[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                    ),
                    if (isSelected)
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 2,
                        width: 20,
                        color: Colors.blue,
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
      body: ListView(
        children: [
          buildImageCard(
            context,
            'assets/images/ring.jpg',
            '추천템을 추천',
            '오늘 하루의 추천템을 확인해보세요.',
          ),
          buildImageCard(
            context,
            'assets/images/chandelier.jpg',
            '이모지를 선택',
            '100가지 이상의 옵션 중 좋아하는 것을 선택하세요.',
          ),
          buildImageCard(
            context,
            'assets/images/gems.jpg',
            '추천을 저장',
            '다양한 추천을 기록하고 저장하세요.',
          ),
          buildImageCard(
            context,
            'assets/images/shadow.jpg',
            '오직 당신만을 위한 추천',
            '맞춤형 추천을 통해 특별한 하루를 만들어보세요.',
          ),
        ],
      ),
    );
  }

  Widget buildImageCard(BuildContext context, String imagePath, String title,
      String description) {
    return Card(
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
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
