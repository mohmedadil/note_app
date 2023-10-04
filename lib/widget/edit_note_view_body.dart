import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widget/custom_Text_field.dart';
import '../models/note_model.dart';
import 'Custom_Appbar.dart';
import 'edit_note_color_listview.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = subtitle ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
              show_Snackbar(context, 'Note had edited successfuly');
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Custom_Text_Field(
            hint: widget.note.title,
            onChange: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Custom_Text_Field(
            hint: widget.note.subtitle,
            maxLines: 5,
            onChange: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorList(note: widget.note),
        ],
      ),
    );
  }
}

void show_Snackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: kPrimarycolor,
    ),
  );
}
