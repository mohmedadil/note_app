import 'package:flutter/material.dart';

import '../constants.dart';

class Custom_Text_Field extends StatelessWidget {
  const Custom_Text_Field({super.key, required this.hint, this.maxLines = 1, this.onsaved, this.onChange});
  final String hint;
  final int maxLines;
  final void Function(String?)? onsaved;
  final  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChange ,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'this field is requird';
        } else {
          return null;
        }
      },
      cursorColor: kPrimarycolor,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hint,
          border: buildborder(),
          enabledBorder: buildborder(),
          focusedBorder: buildborder(color: kPrimarycolor)),
    );
  }

  OutlineInputBorder buildborder({color}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.white),
        borderRadius: BorderRadius.circular(8));
  }
}
