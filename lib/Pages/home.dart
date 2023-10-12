import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubite/cubit/cubit/read_note_cubit.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/widgites/CustomButtonIcon.dart';
import 'package:note_app/widgites/NoteItem.dart';
import 'package:note_app/widgites/RowAppBar.dart';
import 'package:note_app/widgites/addNoteButton.dart';
import 'package:note_app/widgites/bulid_widgit_homeSc.dart';

class HomeNote extends StatefulWidget {
  const HomeNote({super.key});

  @override
  State<HomeNote> createState() => _HomeNoteState();
}

class _HomeNoteState extends State<HomeNote> {
  // void initState() {
  @override
  void initState() {
    BlocProvider.of<ReadNoteCubit>(context).fatchNote();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //  =====.>>>>.>>>>.>>>>.>>>>.>>>>.
      resizeToAvoidBottomInset: false,

      // floting botton =====>>>.
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return AddNoteButton();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        // backgroundColor: kPrimColor,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.all(5),
          child: AppBarWidgite(Titel: 'Notes', icon: Icons.search),
        ),
      ),
      // body: ,

      body: bulid_widgit_homeSc(),
    );
  }
}
