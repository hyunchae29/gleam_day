import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/note_provider.dart';
import 'package:go_router/go_router.dart';

class NoteMain extends ConsumerWidget {
  const NoteMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteList = ref.watch(noteProvider).reversed.toList();
    final recommendedImages =
        ref.watch(recommendedImagesProvider).reversed.toList();
    print('노트 데이터 로드 시도');
    ref.read(noteProvider.notifier).loadNotes();
    ref.read(recommendedImagesProvider.notifier).loadRecommendedImages();
    print('현재 노트 개수: ${noteList.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Note', style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.go('/add_note');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '최근 추천받은 주얼리',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            recommendedImages.isEmpty
                ? SizedBox(
                    height: 200,
                    child: Center(
                        child: Text(
                      '저장된 추천 이미지가 없습니다',
                      style: Theme.of(context).textTheme.bodySmall,
                    )))
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
              color: Colors.pink,
            ), //구분선 나중에 지울예정
            const SizedBox(height: 20),
            Expanded(
              child: noteList.isEmpty
                  ? Center(
                      child: Text(
                      '새로운 메모를 작성해보세요',
                      style: Theme.of(context).textTheme.bodySmall,
                    ))
                  : ListView.builder(
                      itemCount: noteList.length,
                      itemBuilder: (context, index) {
                        final note = noteList[index];
                        return Card(
                          child: ListTile(
                            title: Text(note.title),
                            subtitle: Text(note.content,
                                maxLines: 2, overflow: TextOverflow.ellipsis),
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
          ],
        ),
      ),
    );
  }
}
