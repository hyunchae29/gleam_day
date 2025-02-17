import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note_model.dart';
import '../repositories/note_repository.dart';
import '../repositories/recommend_repository.dart';

final recommendRepositoryProvider = Provider<RecommendRepository>((ref) {
  return RecommendRepository();
});

final noteProvider = StateNotifierProvider<NoteNotifier, List<NoteModel>>(
  (ref) => NoteNotifier(ref.read(noteRepositoryProvider)),
);

final recommendedImagesProvider =
    StateNotifierProvider<RecommendedImagesNotifier, List<String>>(
  (ref) => RecommendedImagesNotifier(ref.read(recommendRepositoryProvider)),
);

class NoteNotifier extends StateNotifier<List<NoteModel>> {
  final NoteRepository _repository;

  NoteNotifier(this._repository) : super([]) {
    loadNotes();
  }

  Future<void> loadNotes() async {
    final notes = await _repository.getNotes();
    state = notes;
  }

  Future<void> addNote(NoteModel note) async {
    await _repository.addNote(note);
    state = [...state, note];
  }

  Future<void> removeNote(String id) async {
    await _repository.deleteNote(id);
    state = state.where((note) => note.id != id).toList();
  }
}

class RecommendedImagesNotifier extends StateNotifier<List<String>> {
  final RecommendRepository _repository;

  RecommendedImagesNotifier(this._repository) : super([]) {
    loadRecommendedImages();
  }

  Future<void> loadRecommendedImages() async {
    final images = await _repository.getRecommendedImages();
    state = images;
  }
}
