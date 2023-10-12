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
            ColorListViwe(),
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
                      var formateDate =
                          DateFormat('dd-MM-yyyy').format(DateTime.now());
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
            ),
          ],
        ),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.Isactive, required this.color});
  final bool Isactive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Isactive
        ? CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 33,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}

class ColorListViwe extends StatefulWidget {
  const ColorListViwe({super.key});

  @override
  State<ColorListViwe> createState() => _ColorListViweState();
}

class _ColorListViweState extends State<ColorListViwe> {
  List<Color> colors = [
    Color(0xffB80C09),
    Color(0xff141301),
    Color(0xffB7B5B3),
    Color(0xff545E56),
    Color(0xff6B2B06),
  ];
  int currentState = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentState = index;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ColorItem(
                color: colors[index],
                Isactive: currentState == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
