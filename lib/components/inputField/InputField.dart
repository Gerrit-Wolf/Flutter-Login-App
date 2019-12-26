import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginDataBloc.dart';
import 'package:test_app/components/inputField/const/InputFieldTypes.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/textStyleOptions.dart';
import 'package:test_app/widgets/BlocProvider.dart';

class InputField extends StatelessWidget {
  const InputField({this.title, this.type, this.userData, this.hintText});

  final String title;
  final String type;
  final String hintText;
  final LoginUserData userData;

  @override
  Widget build(BuildContext context) {
    final LoginDataBloc loginDataBloc = BlocProvider.of<LoginDataBloc>(context);

    return TextField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color(CustomColors.LIGHT_BLUE),
          )
        ),
        suffixIcon: Icon(
            Icons.textsms,
            size: 15.0,
            color: const Color(CustomColors.WHITE),
        ),
        labelText: title,
        hintText: hintText,
        labelStyle: TextStyleOptions.defaultTitle,
        hintStyle: TextStyleOptions.defaultText,
      ),
      style: TextStyleOptions.defaultText,
      obscureText: type == InputFieldTypes.PASSWORD,
      onChanged: (String changedData) {
        loginDataBloc.clearErrorMessage();

        if (type == InputFieldTypes.PASSWORD) {
          userData.password = changedData;
          return;
        }

        userData.email = changedData;
      },
    );
  }
}
