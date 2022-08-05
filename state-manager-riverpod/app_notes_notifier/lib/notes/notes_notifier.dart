import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'note_model.dart';

class NotesNotifier extends StateNotifier<List<NoteModel>> {
  NotesNotifier() : super([]);

  void addNote(NoteModel note) {
    if (note.title.isNotEmpty) {
      state = [note, ...state];
    }
  }

  void removeNote(NoteModel note) {
    state = state.where((noteOfList) => noteOfList != note).toList();
  }
}
