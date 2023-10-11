part of 'read_note_cubit.dart';

@immutable
sealed class ReadNoteState {}

final class ReadNoteInitial extends ReadNoteState {}

final class ReadNoteLoading extends ReadNoteState {}

final class ReadNotefalier extends ReadNoteState {
  final String errorMessage;

  ReadNotefalier(this.errorMessage);
}

final class ReadNoteSuccess extends ReadNoteState {
  final List<NoteModel> note;

  ReadNoteSuccess(this.note);
}
