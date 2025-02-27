import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmojiNotifier extends StateNotifier<List<String>> {
  EmojiNotifier() : super([]);

  void addEmoji(String emoji) {
    state = [...state, emoji];
  }
}

final newEmojiProvider = StateNotifierProvider<EmojiNotifier, List<String>>(
    (ref) => EmojiNotifier());

final editedEmojiProvider = StateNotifierProvider<EmojiNotifier, List<String>>(
    (ref) => EmojiNotifier());
