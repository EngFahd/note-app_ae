import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/widgites/CustomButtonIcon.dart';
import 'package:note_app/widgites/NoteItem.dart';
import 'package:note_app/widgites/RowAppBar.dart';
import 'package:note_app/widgites/addNoteButton.dart';

class HomeNote extends StatelessWidget {
  const HomeNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return AddNoteButton();
            },
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        // backgroundColor: kPrimColor,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.all(5),
          child: AppBarWidgite(Titel: 'Notes',icon:  Icons.search),
        ),
      ),
      // body: ,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return NoteItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

