import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubite/cubit/cubit/read_note_cubit.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/widgites/NoteItem.dart';

class bulid_widgit_homeSc extends StatelessWidget {
  const bulid_widgit_homeSc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNoteCubit, ReadNoteState>(
      builder: (context, state) {
        if (state is ReadNoteSuccess) {
          print(state.note.length);
        }
        if (state is ReadNotefalier) {
          print('failler');
        }
        List<NoteModel> listnotes =
            BlocProvider.of<ReadNoteCubit>(context).listNote ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listnotes.length,
                  itemBuilder: (context, index) {
                    return const NoteItem();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
