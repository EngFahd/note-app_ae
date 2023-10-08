part of 'note_cubit_cubit.dart';

@immutable
sealed class NoteCubitState {}

final class NoteCubitInitial extends NoteCubitState {}

final class NoteCubitSuccess extends NoteCubitState {}

final class NoteCubitLoading extends NoteCubitState {}

final class NoteCubitFailier extends NoteCubitState {
  final String errorMassage;

  NoteCubitFailier({required this.errorMassage});
}
