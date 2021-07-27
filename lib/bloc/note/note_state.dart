part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object?> get props => [];
}

class NotesLoading extends NoteState {}

class NotesLoaded extends NoteState {
final List<Note> notes;

  const NotesLoaded([this.notes = const []]);

  @override
  List<Object?> get props => [notes];

  @override
  String toString() => 'NotesLoaded { notes: $notes }';
}

class NoteNotLoaded extends NoteState {
  final String errorText;

  const NoteNotLoaded(this.errorText);
}