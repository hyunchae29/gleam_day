import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/note_provider.dart';

class RecommendListDialog extends ConsumerWidget {
  const RecommendListDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendedImages = ref.watch(recommendedImagesProvider);

    return AlertDialog(
      title: const Text("추천된 이미지 리스트"),
      content: SizedBox(
        height: 200,
        width: double.maxFinite,
        child: recommendedImages.isEmpty
            ? const Center(child: Text("저장된 추천 이미지가 없습니다"))
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommendedImages.length,
                itemBuilder: (context, index) {
                  final imageUrl = recommendedImages[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context, imageUrl); // 선택한 이미지 반환
                    },
                    child: Card(
                      child: Image.asset(imageUrl,
                          width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  );
                },
              ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, null), // 선택 없이 닫기
          child: const Text("취소"),
        ),
      ],
    );
  }
}

Future<void> showRecommendListDialog(BuildContext context) async {
  final selectedImage = await showDialog<String>(
    context: context,
    builder: (context) => const RecommendListDialog(),
  );
  if (selectedImage != null) {
    Navigator.pushNamed(context, '/note/add_note', arguments: selectedImage);
  }
}
