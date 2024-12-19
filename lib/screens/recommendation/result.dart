import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _Result1State();
}

class _Result1State extends State<Result> {
  String? _selectedImage; // 선택된 이미지 경로 저장

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
                  const Text(
                    '()개의 추천이 만들어졌어요\n마음에 드는 걸 선택해주세요!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSelectableImageContainer(
                          'assets/images/ring_example.jpg'),
                      const SizedBox(width: 10.0),
                      _buildSelectableImageContainer(
                          'assets/images/ring_example2.jpg'),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSelectableImageContainer(
                          'assets/images/ring_example3.jpg'),
                      const SizedBox(width: 10.0),
                      _buildSelectableImageContainer(
                          'assets/images/ring_example4.jpg'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_selectedImage != null) {
                      context.go('/recommendation/success1');
                    } else {
                      _showSelectImageAlert(); // 알럿 호출
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF373333),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    '다음',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'GowunBatang',
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    context.go('/recommendation/finding_page');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF373333),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    '다시 찾기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'GowunBatang',
                    ),
                  ),
                ),
                const SizedBox(height: 40.0)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSelectImageAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF201D1D),
          title: const Text(
            '알림',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GowunBatang',
              fontSize: 20.0,
            ),
          ),
          content: const Text(
            '마음에 드는 걸\n선택해주세요',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GowunBatang',
              fontSize: 18.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '확인',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSelectableImageContainer(String imagePath) {
    final isSelected = _selectedImage == imagePath;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedImage == imagePath) {
            _selectedImage = null; // 같은 이미지를 다시 선택하면 해제
          } else {
            _selectedImage = imagePath; // 새로운 이미지 선택
          }
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10.0),
              border: isSelected
                  ? Border.all(color: Colors.white, width: 3.0)
                  : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          if (isSelected)
            const Positioned(
              bottom: 8.0,
              right: 8.0,
              child: Icon(
                Icons.check_circle,
                color: Colors.blueAccent,
                size: 24.0,
              ),
            ),
        ],
      ),
    );
  }
}
