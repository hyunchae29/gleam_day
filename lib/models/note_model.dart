class NoteModel {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final String date;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.date,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
      date: map['date'] as String,
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
