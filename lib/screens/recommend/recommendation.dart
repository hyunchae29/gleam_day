import 'package:flutter/material.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import '../recommend/introduction.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({Key? key}) : super(key: key);

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  final List<String> sampleImages = [
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
  ];

  int currentImageIndex = 1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startImageChange();
  }

  void _startImageChange() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % sampleImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(initialIndex: 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Stack(
                children: [
                  Image.asset(
                    sampleImages[currentImageIndex],
                    //fit: BoxFit.fill,
                    width: double.infinity,
                    //height: 200,
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      '보석과 종류에 따라 의미',
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
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '오늘은 어떤 날인가요?',
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOptionCircle('날씨'),
                      _buildOptionCircle('하늘'),
                      _buildOptionCircle('기분'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 가운데 정렬
                    children: [
                      _buildOptionCircle('분위기'),
                      _buildOptionCircle('특별한'),
                      _buildOptionCircle('투명'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCircle(String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
