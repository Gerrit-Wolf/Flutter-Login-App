import 'package:flutter/material.dart';
import 'package:test_app/components/inputField/const/InputFieldTypes.dart';
import 'package:test_app/models/LoginUserData.dart';

class InputField extends StatelessWidget {
  const InputField({this.title, this.type, this.userData});

  final String title;
  final String type;
  final LoginUserData userData;

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
        if (type == InputFieldTypes.PASSWORD) {
          userData.password = changedData;
          return;
        }

        userData.email = changedData;
      },
    );
  }
}
