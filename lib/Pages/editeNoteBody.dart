import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubite/cubit/cubit/read_note_cubit.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/widgites/CustomButtonIcon.dart';
import 'package:note_app/widgites/RowAppBar.dart';
import 'package:note_app/widgites/coustemTextFiled.dart';

class editeNoteBody extends StatefulWidget {
  const editeNoteBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<editeNoteBody> createState() => _editeNoteBodyState();
}

class _editeNoteBodyState extends State<editeNoteBody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        // backgroundColor: kPrimColor,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.all(5),
          child: AppBarWidgite(
            Titel: 'Edit Notes',
            icon: Icons.check,
            onpressed: () {
              widget.noteModel.titel = title ?? widget.noteModel.titel;
              widget.noteModel.subTitel = subtitle ?? widget.noteModel.subTitel;
              widget.noteModel.save();
              BlocProvider.of<ReadNoteCubit>(context).fatchNote();
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: [
          customeTextFiled(
              onchanged: (valu) {
                title = valu;
              },
              hint: widget.noteModel.titel),
          customeTextFiled(
              onchanged: (valu) {
                subtitle = valu;
              },
              hint: widget.noteModel.subTitel,
              maxlines: 5),
        ],
      ),
    );
  }
}
