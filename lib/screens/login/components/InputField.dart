import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final Function update;

  InputField(this.title, this.update);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(
            Icons.textsms,
            size: 15.0
        ),
        labelText: this.title,
        labelStyle: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.lightBlueAccent,
        ),
      ),
      onChanged: (String changedData) {
        this.update(this.title, changedData);
      },
    );
  }
}
