import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Pages/home.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/models/model_note.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kPrimaryWord);
  Hive.registerAdapter(NoteModelAdapter());
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
