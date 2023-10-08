part of 'read_note_cubit.dart';

@immutable
sealed class ReadNoteState {}

final class ReadNoteInitial extends ReadNoteState {}

final class ReadNoteLoading extends ReadNoteState {}

final class ReadNoteSuccess extends ReadNoteState {
   final List<NoteModel> note;

  ReadNoteSuccess(this.note);
}

final class ReadNoteFailier extends ReadNoteState {
  final String message;
  ReadNoteFailier(this.message);
}
