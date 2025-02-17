import '../models/note_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  return NoteRepository();
});

class NoteRepository {
  final List<NoteModel> _notes = []; // 임시 저장소 (추후 DB 연동 가능)

  Future<List<NoteModel>> getNotes() async {
    return _notes;
  }

  Future<void> addNote(NoteModel note) async {
    _notes.add(note);
  }

  Future<void> deleteNote(String id) async {
    _notes.removeWhere((note) => note.id == id);
  }
}
