import 'package:flutter/material.dart';

class NoteMain extends StatelessWidget {
  const NoteMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteList = []; // 더미 데이터 이렇게 진행하면 안될거같음, 프로바이더 적용 필요

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Note',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {}, // 설정 페이지 이동 예정
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
            const SizedBox(height: 400),
            noteList.isEmpty
                ? const Center(child: Text('새로운 메모를 추가해보세요'))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: noteList.length,
                          itemBuilder: (context, index) {
                            final note = noteList[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/result',
                                  arguments: note,
                                );
                              },
                              child: Card(
                                color: Colors.black87,
                                child: Column(
                                  children: [
                                    Image.network(note.imageUrl,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover),
                                    const SizedBox(height: 4),
                                    Text(note.date,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: noteList.length,
                          itemBuilder: (context, index) {
                            final note = noteList[index];
                            return Card(
                              child: ListTile(
                                title: Text(note.title),
                                subtitle: Text(note.content,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
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
          ],
        ),
      ),
    );
  }
}
