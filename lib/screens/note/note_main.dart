import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/recommend_message.dart';
import '../../providers/note_provider.dart';
import '../../common/message.dart';

//todo: filename, path, full_path 로 이미지 관리필요

class NoteMain extends ConsumerWidget {
  const NoteMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('노트 데이터 로드 시도');
    final noteList = ref.watch(noteProvider).reversed.toList();
    final recommendedImages =
        ref.watch(recommendedImagesProvider).reversed.toList();
    print('현재 노트 개수: ${noteList.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Note', style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showRecommendDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '최근 추천받은 주얼리',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            recommendedImages.isEmpty
                ? SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '저장된 추천 이미지가 없습니다',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              showMessageDialog(context);
                            },
                            child: Text(
                              '추천 받기',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ))
                : SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendedImages.length,
                      itemBuilder: (context, index) {
                        final imageUrl = recommendedImages[index];
                        return Card(
                          color: Colors.black87,
                          child: Image.network(imageUrl,
                              width: 100, height: 100, fit: BoxFit.cover),
                        );
                      },
                    ),
                  ),
            const Divider(
              thickness: 1,
              height: 30,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  noteList.isEmpty
                      ? Center(
                          child: Text(
                            '새로운 메모를 작성해 보세요.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      : Expanded(
                          // 리스트뷰를 올바르게 배치
                          child: ListView.builder(
                            itemCount: noteList.length,
                            itemBuilder: (context, index) {
                              final note = noteList[index];
                              return Card(
                                child: ListTile(
                                  title: Text(note.title),
                                  subtitle: Text(
                                    note.content,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/result',
                                      arguments: note,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                  const SizedBox(height: 12), // 버튼과 리스트 간격 조정
                  ElevatedButton(
                    onPressed: () {
                      showRecommendDialog(context);
                    },
                    child: Text(
                      '메모 작성',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
