import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/model_note.dart';

part 'read_note_state.dart';

class ReadNoteCubit extends Cubit<ReadNoteState> {
  ReadNoteCubit() : super(ReadNoteInitial());

  List<NoteModel>? listNote;
  fatchNote() {
   
      var box = Hive.box<NoteModel>(kPrimaryWord);

       listNote = box.values.toList();
      
      emit(ReadNoteSuccess(listNote!));
   
  }
}
