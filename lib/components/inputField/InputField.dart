import 'package:flutter/material.dart';
import 'package:test_app/components/inputField/const/InputFieldTypes.dart';
import 'package:test_app/models/LoginUserData.dart';

class InputField extends StatelessWidget {
  const InputField({this.title, this.type, this.userData, this.onChanged});

  final String title;
  final String type;
  final LoginUserData userData;
  final Function onChanged;

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
        userData.errorMessage = null;

        if (type == InputFieldTypes.PASSWORD) {
          userData.password = changedData;
          onChanged();
          return;
        }

        userData.email = changedData;
        onChanged();
      },
    );
  }
}
