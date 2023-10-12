import 'package:flutter/material.dart';
import 'package:note_app/widgites/CustomButtonIcon.dart';

class AppBarWidgite extends StatelessWidget {
  const AppBarWidgite({
    super.key, required this.Titel, required this.icon, this.onpressed,
  });
  final String Titel;
  final IconData icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          Titel,
          style: TextStyle(fontSize: 30),
        ),
        Spacer(
          flex: 1,
        ),
        CustomButtonIcon(icon: icon,
        onpressed:onpressed ,)
      ],
    );
  }
}
