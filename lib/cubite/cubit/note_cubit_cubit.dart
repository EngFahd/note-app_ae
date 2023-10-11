import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/model_note.dart';

part 'note_cubit_state.dart';

class NoteCubitCubit extends Cubit<NoteCubitState> {
  NoteCubitCubit() : super(NoteCubitInitial());

  void addNote(NoteModel note) async {
    emit(NoteCubitLoading());
    try {
      // open hive box
      var box = Hive.box<NoteModel>(kPrimaryWord);
      // add note in hive box
      print(box.values);
      // ===============
      await box.add(note);
      // ===============
      emit(NoteCubitSuccess());
    } catch (e) {
      emit(NoteCubitFailier(e.toString()));
    }
  }
}
