import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/local_services/note_service.dart';
import 'package:notepad/models/note.dart';

part 'note_event.dart';

part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc(this._noteService) : super(NotesLoading());
  final NoteService _noteService;

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    if (event is LoadNotes) {
      yield NotesLoading();
      try{
        final notes = await _noteService.getAll();
        yield NotesLoaded(notes);
      } catch (e) {
        yield NoteNotLoaded('$e');
      }
    } else if (event is AddNote) {
      yield* _mapAddNoteToState(event);
    } else if (event is UpdateNote) {
      yield* _mapUpdateNoteToState(event);
    } else if (event is DeleteNote) {
      yield* _mapDeleteNoteToState(event);
    }
  }

  Stream<NoteState> _mapAddNoteToState(AddNote event) async* {
    try {
      await _noteService.create(event.note);
      final notes = await _noteService.getAll();
      yield NotesLoaded(notes);
    } catch (e) {
      yield NoteNotLoaded('CreateError $e');
    }
  }

  Stream<NoteState> _mapUpdateNoteToState(UpdateNote event) async* {
    try {
      await _noteService.update(event.note);
      final notes = await _noteService.getAll();
      yield NotesLoaded(notes);
    } catch (e) {
      yield NoteNotLoaded('updateError $e');
    }
  }

  Stream<NoteState> _mapDeleteNoteToState(DeleteNote event) async* {
    try {
      await _noteService.delete(event.note.id!);
      final notes = await _noteService.getAll();
      yield NotesLoaded(notes);
    } catch (e) {
      yield NoteNotLoaded('deleteError');
    }
  }

  @override
  Future<void> close() {
    _noteService.close();
    return super.close();
  }
}
