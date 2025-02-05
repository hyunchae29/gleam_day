class Recommendation {
  final int? id; // SQLite에서는 ID 필드가 필요함 (nullable)
  final String category; // 추천 카테고리
  final String name; // 추천 아이템 이름

  Recommendation({this.id, required this.category, required this.name});

  // SQLite에서 데이터를 가져올 때 사용
  factory Recommendation.fromMap(Map<String, dynamic> map) {
    return Recommendation(
      id: map['id'],
      category: map['category'],
      name: map['name'],
    );
  }

  // SQLite에 데이터를 저장할 때 사용
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'name': name,
    };
  }
}
