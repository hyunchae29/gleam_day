class Emoji {
  final int id;
  final String key;
  final String label;
  final String category;

  Emoji({
    required this.id,
    required this.key,
    required this.label,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'key': key,
      'label': label,
      'category': category,
    };
  }

  factory Emoji.fromMap(Map<String, dynamic> map) {
    return Emoji(
      id: map['id'],
      key: map['key'],
      label: map['label'],
      category: map['category'],
    );
  }
}

final List<Map<String, String>> categories = [
  {"key": "weather", "label": "날씨"},
  {"key": "sky", "label": "하늘"},
  {"key": "emotion", "label": "기분"},
  {"key": "feeling", "label": "분위기"},
  {"key": "moment", "label": "특별한"},
];

final List<Emoji> allEmojis = [
  // 이거 다 예시
  Emoji(id: 1, key: "sunny", label: "맑은 날", category: "weather"),
  Emoji(id: 2, key: "rainy", label: "비오는 날", category: "weather"),
  Emoji(id: 3, key: "cloudy", label: "흐린 날", category: "weather"),
  Emoji(id: 4, key: "stormy", label: "폭풍우", category: "weather"),
  Emoji(id: 5, key: "snowy", label: "눈 오는 날", category: "weather"),
  Emoji(id: 6, key: "windy", label: "바람 부는 날", category: "weather"),
  //2
  Emoji(id: 7, key: "happy", label: "기분 좋음", category: "emotion"),
  Emoji(id: 8, key: "sad", label: "우울함", category: "emotion"),
  Emoji(id: 9, key: "excited", label: "설렘", category: "emotion"),
  Emoji(id: 10, key: "angry", label: "화남", category: "emotion"),
  Emoji(id: 11, key: "calm", label: "평온", category: "emotion"),
  Emoji(id: 12, key: "nervous", label: "긴장", category: "emotion"),
  //3,
  Emoji(id: 13, key: "morning", label: "아침", category: "sky"),
  Emoji(id: 14, key: "afternoon", label: "오후", category: "sky"),
  Emoji(id: 15, key: "evening", label: "저녁", category: "sky"),
  Emoji(id: 16, key: "night", label: "밤", category: "sky"),
  Emoji(id: 17, key: "midnight", label: "자정", category: "sky"),
  Emoji(id: 18, key: "dawn", label: "새벽", category: "sky"),
  //4
  Emoji(id: 19, key: "birthday", label: "생일", category: "moment"),
  Emoji(id: 20, key: "holiday", label: "휴일", category: "moment"),
  Emoji(id: 21, key: "wedding", label: "결혼식", category: "moment"),
  Emoji(id: 22, key: "party", label: "파티", category: "moment"),
  Emoji(id: 23, key: "date", label: "데이트", category: "moment"),
  Emoji(id: 24, key: "festival", label: "축제", category: "moment"),
  //5
  Emoji(id: 25, key: "sports", label: "스포츠", category: "feeling"),
  Emoji(id: 26, key: "study", label: "공부", category: "feeling"),
  Emoji(id: 27, key: "travel", label: "여행", category: "feeling"),
  Emoji(id: 28, key: "work", label: "일", category: "feeling"),
  Emoji(id: 29, key: "relax", label: "휴식", category: "feeling"),
  Emoji(id: 30, key: "shopping", label: "쇼핑", category: "feeling"),
];

final List<String> sampleImages = [
  'assets/images/5.png',
  'assets/images/6.png',
  'assets/images/7.png',
  'assets/images/8.png',
  'assets/images/9.png',
];
