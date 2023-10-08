import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class customeTextFiled extends StatelessWidget {
  const customeTextFiled({
    super.key,
    this.maxlines = 1,
    required this.hint,
    this.onsaved,
  });

  final int maxlines;
  final String hint;
  final Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: onsaved,
        validator: (valu) {
          if (valu?.isEmpty ?? true) {
            return 'Filed is Required';
          } else {
            return null;
          }
        },
        cursorColor: kPrimColor,
        maxLines: maxlines,
        decoration: InputDecoration(
          hintText: hint,

          // hintStyle: const TextStyle(color: kPrimColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kPrimColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
