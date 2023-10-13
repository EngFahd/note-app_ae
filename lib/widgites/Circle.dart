// Circle widget
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubite/cubit/note_cubit_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 30,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}

// Circle Animations
class ColorListViwe extends StatefulWidget {
  const ColorListViwe({super.key});

  @override
  State<ColorListViwe> createState() => _ColorListViweState();
}

class _ColorListViweState extends State<ColorListViwe> {
  int currentState = 0;
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
              BlocProvider.of<NoteCubitCubit>(context).color = kColors[index];

              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
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
