import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Pages/home.dart';
import 'package:note_app/blocOserver.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubite/cubit/cubit/read_note_cubit.dart';
import 'package:note_app/cubite/cubit/note_cubit_cubit.dart';
import 'package:note_app/models/model_note.dart';
void main() async {
  await Hive.initFlutter();
  // the best way to know state than printing
  Bloc.observer = simpleopserver();
  // tell hive the data saved is note model;
  Hive.registerAdapter(NoteModelAdapter());
  
  // remmber the type of data saved
  await Hive.openBox<NoteModel>(kPrimaryWord);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReadNoteCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: HomeNote(),
      ),
    );
  }
}
