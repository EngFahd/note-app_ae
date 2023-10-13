import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubite/cubit/cubit/read_note_cubit.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/widgites/EditeNoteColorList.dart';
import 'package:note_app/widgites/RowAppBar.dart';
import 'package:note_app/widgites/coustemTextFiled.dart';

class EditeNoteBody extends StatefulWidget {
  const EditeNoteBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditeNoteBody> createState() => _EditeNoteBodyState();
}

class _EditeNoteBodyState extends State<EditeNoteBody> {
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
            titel: 'Edit Notes',
            icon: Icons.check,
            onpressed: () {
              // update the note
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
          CustomeTextFiled(
              onchanged: (valu) {
                title = valu;
              },
              hint: widget.noteModel.titel),
          CustomeTextFiled(
              onchanged: (valu) {
                subtitle = valu;
              },
              hint: widget.noteModel.subTitel,
              maxlines: 5),
          const SizedBox(height: 20),
          EditeNoteColorList(
            noteModel: widget.noteModel,
          ),
        ],
      ),
    );
  }
}
