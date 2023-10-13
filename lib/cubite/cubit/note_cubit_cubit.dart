import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/model_note.dart';

part 'note_cubit_state.dart';

class NoteCubitCubit extends Cubit<NoteCubitState> {
  NoteCubitCubit() : super(NoteCubitInitial());

  Color? color =const Color(0xff545E56);
  addNote(NoteModel note) async {

    note.color = color!.value;

    emit(NoteCubitLoading());

    // open hive box
    var box = Hive.box<NoteModel>(kPrimaryWord);
    // add note in hive box
    // ===============
    await box.add(note);
    // ===============
    emit(NoteCubitSuccess());
  }
}
