import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/model_note.dart';
import 'package:note_app/widgites/Circle.dart';

class EditeNoteColorList extends StatefulWidget {
  const EditeNoteColorList({super.key, required this.noteModel});

  final NoteModel noteModel;
  @override
  State<EditeNoteColorList> createState() => _EditeNoteColorListState();
}

class _EditeNoteColorListState extends State<EditeNoteColorList> {
  late int currentState;

  @override
  void initState() {
    currentState = kColors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentState = index;
              widget.noteModel.color = kColors[index].value;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ColorItem(
                color: kColors[index],
                isActive: currentState == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
