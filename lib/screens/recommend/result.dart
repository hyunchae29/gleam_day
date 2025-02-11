import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/loading.dart';
import '../../models/emoji_model.dart';
import '../../models/recommend_model.dart';
import '../../repositories/recommend_repository.dart';

class ResultPage extends StatefulWidget {
  final Emoji emoji;

  const ResultPage({super.key, required this.emoji});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> _saveRecommendation() async {
    final recommendation = Recommendation(
      category: widget.emoji.category,
      name: widget.emoji.label,
      createdAt: DateTime.now().toIso8601String(),
    );

    await RecommendRepository.insertRecommendation(recommendation);

    print(
        '✅ Recommendation saved: ${recommendation.category}, ${recommendation.name}');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('추천이 저장되었습니다!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const LoadingPage();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home/recommendation'),
          // 이거로 넘어가기 전에 warning page 호출 및 확인 요청
        ),
        title: Text(
          '추천',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: _saveRecommendation,
            child: const Text('저장'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  bool isSelected = category["key"] == widget.emoji.category;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: isSelected
                                ? Border.all(color: Colors.blue, width: 3)
                                : null,
                          ),
                          child: Image.asset(
                            'assets/categories/${category["key"]}.png',
                            width: 40,
                            height: 40,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error,
                                    size: 40, color: Colors.red),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category["label"]!,
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: isSelected ? 14 : 12,
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allEmojis
                    .where((e) => e.category == widget.emoji.category)
                    .length,
                itemBuilder: (context, index) {
                  final e = allEmojis
                      .where((e) => e.category == widget.emoji.category)
                      .elementAt(index);
                  bool isSelected = e.key == widget.emoji.key;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      e.label,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: isSelected ? 18 : 16,
                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/jewelry/${widget.emoji.key}.png',
                    width: 200,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, size: 200, color: Colors.red),
                  ),
                  const SizedBox(height: 8),
                  Text("오늘의 추천은 ${widget.emoji.label} 스타일의 주얼리입니다!",
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
