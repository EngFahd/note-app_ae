import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Pages/home.dart';
import 'package:note_app/blocOserver.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubite/cubit/note_cubit_cubit.dart';
import 'package:note_app/models/model_note.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = simpleopserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kPrimaryWord);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeNote(),
    );
  }
}
