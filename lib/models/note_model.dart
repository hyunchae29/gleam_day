import 'package:uuid/uuid.dart';

class NoteModel {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final String date;

  NoteModel({
    String? id,
    required this.title,
    required this.content,
    String? imageUrl,
    String? date,
  })  : id = id ?? const Uuid().v4(),
        imageUrl = imageUrl ?? '',
        date = date ?? DateTime.now().toIso8601String();

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] as String?,
      title: map['title'] as String? ?? '',
      content: map['content'] as String? ?? '',
      imageUrl: map['imageUrl'] as String?,
      date: map['date'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'date': date,
    };
  }
}
