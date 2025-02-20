import 'package:sqflite/sqflite.dart';
import '../models/recommend_model.dart';
import '../database/sqlite/database_helper.dart';

class RecommendRepository {
  Future<void> insertRecommendation(Recommendation recommendation) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('recommendations', recommendation.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Recommendation>> getRecommendations(String category) async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db
        .query('recommendations', where: 'category = ?', whereArgs: [category]);
    return List.generate(maps.length, (i) => Recommendation.fromMap(maps[i]));
  }

  Future<void> deleteRecommendation(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('recommendations', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<String>> getRecommendedImages() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps =
        await db.query('recommendations', columns: ['imageUrl']);
    return maps.map((map) => map['imageUrl'] as String).toList();
  }

  Future<Map<String, dynamic>?> getHistoryByDate(String date) async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> result = await db.query(
      'history',
      where: 'event_date = ?',
      whereArgs: [date],
    );
    return result.isNotEmpty ? result.first : null;
  }
}
