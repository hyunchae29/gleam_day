import 'package:flutter/material.dart';
import '../../common/custom_widget/recommend_top_app_bar.dart';

//todo JH: TopAppBar는 다른 파일로 분리, common/appbarWidget/recommend_topapp, common/appbarWidget/emoji_topapp 추가 필요
// 공통 위젯으로 빼는 방향이 정당한가? 고민 필요성 있음

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
