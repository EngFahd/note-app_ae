import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubite/cubit/note_cubit_cubit.dart';

class customButton extends StatelessWidget {
  const customButton({super.key, this.ontap, this.isLoading = true});
  final void Function()? ontap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: kPrimColor),
        child: BlocBuilder<NoteCubitCubit, NoteCubitState>(
          builder: (context, state) {
            isLoading:
            state is NoteCubitLoading ? true : false;
            return Center(
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      'Add',
                      style: TextStyle(color: Colors.black),
                    ),
            );
          },
        ),
      ),
    );
  }
}
