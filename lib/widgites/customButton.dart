import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class customButton extends StatelessWidget {
  const customButton({super.key, this.ontap});
 final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: kPrimColor),
        child: const Center(
          child: Text(
            'Add',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
