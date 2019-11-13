import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(this.title, this.update);

  final String title;
  final Function update;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(
            Icons.textsms,
            size: 15.0
        ),
        labelText: title,
        labelStyle: TextStyle(
          fontFamily: 'Roboto',
          color: const Color(0xff636e72),
        ),
      ),
      onChanged: (String changedData) {
        this.update(title, changedData);
      },
    );
  }
}
