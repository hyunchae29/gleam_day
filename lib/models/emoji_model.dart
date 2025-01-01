class Emoji {
  final int id;
  final String name;
  final String color;

  Emoji({required this.id, required this.name, required this.color});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'color': color};
  }

  factory Emoji.fromMap(Map<String, dynamic> map) {
    return Emoji(
      id: map['id'],
      name: map['name'],
      color: map['color'],
    );
  }
}
