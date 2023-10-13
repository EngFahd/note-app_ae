import 'package:flutter/material.dart';
import 'package:note_app/widgites/CustomButtonIcon.dart';

class AppBarWidgite extends StatelessWidget {
  const AppBarWidgite({
    super.key,
    required this.titel,
    required this.icon,
    this.onpressed,
  });
  final String titel;
  final IconData icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titel,
          style: const TextStyle(fontSize: 30),
        ),
        const Spacer(
          flex: 1,
        ),
        CustomButtonIcon(
          icon: icon,
          onpressed: onpressed,
        ),
      ],
    );
  }
}
