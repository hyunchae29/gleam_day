import 'package:sqflite/sqflite.dart';

class EmojiRepository {
  final Database db;

  EmojiRepository(this.db);

  Future<void> insertEmoji(Emoji emoji) async {
    await db.insert('emojis', emoji.toMap());
  }

  Future<List<Emoji>> fetchAllEmojis() async {
    final List<Map<String, dynamic>> maps = await db.query('emojis');
    return List.generate(maps.length, (i) => Emoji.fromMap(maps[i]));
  }
}
