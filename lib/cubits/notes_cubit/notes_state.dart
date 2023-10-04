part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

final class NotesInitial extends NotesState {}

final class NoteSuccess extends NotesState {}
