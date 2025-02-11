import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/emoji_model.dart';

class NewRecommendation extends StatelessWidget {
  final Map<String, String> option;

  const NewRecommendation({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    final categoryKey = option['key'] ?? '';
    final categoryLabel = option['label'] ?? '추천';
    final filteredEmojis =
        allEmojis.where((emoji) => emoji.category == categoryKey).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryLabel),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home/recommendation'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$categoryLabel",
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            Text("오늘의 이모지는 뭘까요?", style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 30),
            Expanded(
              child: filteredEmojis.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 30,
                        childAspectRatio: 2,
                      ),
                      itemCount: filteredEmojis.length,
                      itemBuilder: (context, index) {
                        final emoji = filteredEmojis[index];
                        return GestureDetector(
                          onTap: () {
                            context.go('/home/result', extra: emoji);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/emojis/${emoji.key}.png',
                                  width: 40,
                                  height: 40,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.error,
                                          size: 40, color: Colors.red),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    emoji.label,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "이 카테고리에 해당하는 이모지가 없습니다. 이거 나오면 에러",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
