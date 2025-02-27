import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/custom_widget/recommend_top_app_bar.dart';
import '../../models/emoji_model.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({Key? key}) : super(key: key);

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
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
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Stack(
                children: [
                  Image.asset(
                    sampleImages[currentImageIndex],
                    width: double.infinity,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '오늘은 어떤 날인가요?',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: categories
                        .take(3)
                        .map(
                            (category) => _buildOptionCircle(context, category))
                        .toList(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...categories.skip(3).take(2).map(
                          (category) => _buildOptionCircle(context, category)),
                      Opacity(
                        opacity: 0.0,
                        child: _buildOptionCircle(
                            context, {"key": "transparent", "label": ""}),
                      ),
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
}

Widget _buildOptionCircle(BuildContext context, Map<String, String> category) {
  String imagePath = 'assets/categories/${category["key"]}.png';
  return GestureDetector(
    onTap: () => context.go('/home/new_recommendation', extra: category),
    child: Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFD9D9D9),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          category["label"] ?? '',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    ),
  );
}
