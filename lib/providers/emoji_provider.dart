import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/emoji_model.dart';
import '../repositories/emoji_repository.dart';

final emojiProvider = StateNotifierProvider<EmojiNotifier, List<Emoji>>((ref) {
  final repository = ref.read(emojiRepositoryProvider);
  return EmojiNotifier(repository);
});

class EmojiNotifier extends StateNotifier<List<Emoji>> {
  final EmojiRepository repository;

  EmojiNotifier(this.repository) : super([]);

  Future<void> loadEmojis() async {
    state = await repository.fetchAllEmojis();
  }

  Future<void> addEmoji(Emoji emoji) async {
    await repository.insertEmoji(emoji);
    state = [...state, emoji];
  }
}
