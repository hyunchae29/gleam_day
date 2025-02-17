import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/recommend_model.dart';
import '../database/sqlite/database_helper.dart';

class RecommendRepository {
  //todo: jh, final db = await DatabaseHelper.instance.database; 를 함수 밖으로 뽑는게 좋겠음.

  // 추천 데이터 추가
  Future<void> insertRecommendation(Recommendation recommendation) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('recommendations', recommendation.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // 특정 카테고리의 추천 데이터 가져오기
  Future<List<Recommendation>> getRecommendations(String category) async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db
        .query('recommendations', where: 'category = ?', whereArgs: [category]);
    return List.generate(maps.length, (i) => Recommendation.fromMap(maps[i]));
  }

  // 추천 데이터 삭제
  Future<void> deleteRecommendation(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('recommendations', where: 'id = ?', whereArgs: [id]);
  }

  // 저장된 추천 이미지 가져오기
  Future<List<String>> getRecommendedImages() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps =
        await db.query('recommendations', columns: ['imageUrl']);
    return maps.map((map) => map['imageUrl'] as String).toList();
  }
}
