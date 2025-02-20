class Recommendation {
  final int? id;
  final String category;
  final String name;
  final String createdAt;
  final String imageURL;

  Recommendation({
    this.id,
    required this.category,
    required this.name,
    required this.createdAt,
    required this.imageURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'created_at': createdAt,
      'imageURL': imageURL,
    };
  }

  factory Recommendation.fromMap(Map<String, dynamic> map) {
    return Recommendation(
      id: map['id'],
      category: map['category'],
      name: map['name'],
      createdAt: map['created_at'],
      imageURL: map['imageURL'],
    );
  }
}
