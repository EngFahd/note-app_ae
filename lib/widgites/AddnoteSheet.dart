import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubite/cubit/note_cubit_cubit.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/widgites/coustemTextFiled.dart';
import 'package:note_app/widgites/customButton.dart';

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> glopalKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? titel, subTitel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: glopalKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            customeTextFiled(
                onsaved: (valu) {
                  titel = valu;
                },
                hint: 'titel'),
            const SizedBox(
              height: 20,
            ),
            customeTextFiled(
              onsaved: (valu) {
                subTitel = valu;
              },
              hint: 'content',
              maxlines: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<NoteCubitCubit, NoteCubitState>(
              builder: (context, state) {
                return customButton(
                  isLoading: state is NoteCubitLoading ? true : false,
                  ontap: () {
                    if (glopalKey.currentState!.validate()) {
                      glopalKey.currentState!.save();
                      // formateDate(buttern)
                      var formateDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                      NoteModel noteModel = NoteModel(
                          titel: titel!,
                          subTitel: subTitel!,
                          date: formateDate,
                          color: Colors.blue.value);
                      BlocProvider.of<NoteCubitCubit>(context)
                          .addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
