part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  final Note note;

  const AddNote(this.note);

  @override
  List<Object?> get props => [note];

  @override
  String toString() => 'AddNote { note: $note }';
}

class UpdateNote extends NoteEvent {
  final Note note;

  const UpdateNote(this.note);

  @override
  List<Object?> get props => [note];

  @override
  String toString() => 'UpdateNote { updateNote: $note }';
}

class DeleteNote extends NoteEvent {
  final Note note;

  const DeleteNote(this.note);

  @override
  List<Object?> get props => [note];

  @override
  String toString() => 'DeleteNote { deleteNote: $note';
}

class NotesUpdated extends NoteEvent {
  final List<Note> notes;

  const NotesUpdated(this.notes);

  @override
  List<Object?> get props => [notes];
}
