import 'package:hive/hive.dart';
// flutter packages pub run build_runner build
part 'model_note.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String titel;
  @HiveField(1)
  final String subTitel;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel(
      {required this.titel,
      required this.subTitel,
      required this.date,
      required this.color});
}
