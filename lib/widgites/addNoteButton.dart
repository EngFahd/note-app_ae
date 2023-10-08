import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubite/cubit/note_cubit_cubit.dart';
import 'package:note_app/widgites/AddnoteSheet.dart';
import 'package:note_app/widgites/coustemTextFiled.dart';
import 'package:note_app/widgites/customButton.dart';

class AddNoteButton extends StatelessWidget {
  AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // clipBehavior: Clip.none,
      child: BlocConsumer<NoteCubitCubit, NoteCubitState>(
        listener: (context, state) {
          if (state is NoteCubitFailier) {
            print('titrl ${state.errorMassage}');
          } else if (state is NoteCubitSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: ModalProgressHUD(
                  inAsyncCall: state is NoteCubitLoading ? true : false,
                  child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}

