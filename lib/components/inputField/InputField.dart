import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginUserDataBloc.dart';
import 'package:test_app/components/inputField/const/InputFieldTypes.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/widgets/BlocProvider.dart';

class InputField extends StatelessWidget {
  const InputField({this.title, this.type, this.userData});

  final String title;
  final String type;
  final LoginUserData userData;

  @override
  Widget build(BuildContext context) {
    final LoginUserDataBloc userDataBloc = BlocProvider.of<LoginUserDataBloc>(context);

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
          userDataBloc.updateUserData(userData);
          return;
        }

        userData.email = changedData;
        userDataBloc.updateUserData(userData);
      },
    );
  }
}
