import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubite/cubit/note_cubit_cubit.dart';
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
              child: AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}

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
            customButton(
              ontap: () {
                if (glopalKey.currentState!.validate()) {
                  glopalKey.currentState!.save();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
