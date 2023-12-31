import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubite/cubit/cubit/read_note_cubit.dart';
import 'package:note_app/cubite/cubit/note_cubit_cubit.dart';
import 'package:note_app/widgites/AddnoteSheet.dart';

class AddNoteButton extends StatelessWidget {
 const AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubitCubit(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        // consumer => rebuild ui and add some code
        // lisner => no change bt check some code
        // builder => rebuild only
        child: BlocConsumer<NoteCubitCubit, NoteCubitState>(
          listener: (context, state) {
            if (state is NoteCubitFailier) {
              print('titel ${state.errorMassage}');
            }
            if (state is NoteCubitSuccess) {
              BlocProvider.of<ReadNoteCubit>(context).fatchNote();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is NoteCubitLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child:const SingleChildScrollView(
                  child: AddNoteForm(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
