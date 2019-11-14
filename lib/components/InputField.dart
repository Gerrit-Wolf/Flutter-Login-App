import 'package:flutter/material.dart';
import 'package:test_app/components/const/InputFieldTypes.dart';

class InputField extends StatelessWidget {
  const InputField(this.title, this.type, this.update);

  final String title;
  final String type;
  final Function update;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(
            Icons.textsms,
            size: 15.0
        ),
        labelText: title,
        labelStyle: const TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xff636e72),
        ),
      ),
      obscureText: type == InputFieldTypes.PASSWORD,
      onChanged: (String changedData) {
        this.update(type, changedData);
      },
    );
  }
}
