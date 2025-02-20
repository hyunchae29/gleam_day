import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/loading.dart';
import '../../models/emoji_model.dart';
import '../../models/recommend_model.dart';
import '../../providers/recommend_provider.dart';

class ResultPage extends ConsumerStatefulWidget {
  final Emoji emoji;

  const ResultPage({super.key, required this.emoji});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends ConsumerState<ResultPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      //duration 시간 조정 필요
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
        imageURL: 'assets/jewelry/${widget.emoji.key.toLowerCase()}.png');

    print(recommendation);

    final repository = ref.read(recommendRepositoryProvider);
    await repository.insertRecommendation(recommendation);

    print(
        'Recommendation saved: ${recommendation.category}, ${recommendation.name}, ${recommendation.imageURL}');

    //디자인 변경 필요
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
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
