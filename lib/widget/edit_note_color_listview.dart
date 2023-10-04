import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

import '../models/note_model.dart';
import 'color_item.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentindex;
  @override
  void initState() {
    currentindex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentindex = index;
                  widget.note.color = kColors[index].value;
                });
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentindex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}

