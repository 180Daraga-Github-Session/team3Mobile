part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteCubitInitial extends NoteState {}

class NoteLoadingState extends NoteState {}

class NoteSuccessState extends NoteState {}

class NoteErrorState extends NoteState {}
