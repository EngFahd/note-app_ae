import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Pages/editeNoteBody.dart';
import 'package:note_app/cubite/cubit/cubit/read_note_cubit.dart';
import 'package:note_app/models/model_note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return editeNoteBody(
                  noteModel: noteModel,
                );
              },
            ),
          );
        },
        child: Container(
          // height: 150,
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            bottom: 24,
          ),
          decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  noteModel.titel,
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "${noteModel.subTitel}",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      // becouse the model extend hive object
                      noteModel.delete();
                      BlocProvider.of<ReadNoteCubit>(context).fatchNote();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 35,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  noteModel.date,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.2), fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
