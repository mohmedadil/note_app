import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/addnote_cubit/addnote_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/widget/color_item.dart';
import '../constants.dart';
import 'Custom_button.dart';
import 'custom_Text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidate = AutovalidateMode.disabled;
  String? title, subtitle;
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidate,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Custom_Text_Field(
            onsaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          Custom_Text_Field(
            onsaved: (value) {
              subtitle = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddnoteCubit, AddnoteState>(
            builder: (context, state) {
              return CustomBottom(
                isLoading: state is AddnoteLoading ? true : false,
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentdate = DateTime.now();
                    var formattedDate =
                        DateFormat('dd-mm-yyyy').format(currentdate);
                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formattedDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddnoteCubit>(context).addnote(noteModel);
                    show_Snackbar(context, 'Add Note Successfully');
                  } else {
                    autovalidate = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 32,
          ),
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
