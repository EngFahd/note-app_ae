import 'package:flutter/material.dart';
import 'package:note_app/widgites/CustomButtonIcon.dart';
import 'package:note_app/widgites/RowAppBar.dart';
import 'package:note_app/widgites/coustemTextFiled.dart';

class editeNoteBody extends StatelessWidget {
  const editeNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          // backgroundColor: kPrimColor,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:const Padding(
            padding: EdgeInsets.all(5),
            child: AppBarWidgite(Titel: 'Edit Notes', icon: Icons.check),
          ),
        ),
        body:const Column(
          children: [
            customeTextFiled(hint: 'titel'),
            customeTextFiled(hint: 'content', maxlines: 5),
          ],
        ));
  }
}
