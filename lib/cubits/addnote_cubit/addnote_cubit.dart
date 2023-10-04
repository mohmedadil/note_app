import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());
  Color color = Color(0xffE63946);
  addnote(NoteModel note) async {
    note.color = color.value;
    emit(AddnoteLoading());
    try {
      var notesbox = Hive.box<NoteModel>(kNotesbox);
      await notesbox.add(note);
      emit(AddnoteSuccess());
    } on Exception catch (e) {
      emit(AddnoteFaulier(e.toString()));
    }
  }
}
