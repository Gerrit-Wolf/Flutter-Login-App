import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginDataBloc.dart';
import 'package:test_app/components/inputField/const/InputFieldTypes.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/regularExpressions.dart';
import 'package:test_app/shared/const/textStyleOptions.dart';
import 'package:test_app/widgets/BlocProvider.dart';

class InputField extends StatefulWidget {
  const InputField({this.title, this.type, this.userData, this.hintText});

  final String title;
  final String type;
  final String hintText;
  final LoginUserData userData;

  @override
  State<StatefulWidget> createState() => InputFieldState(title: title, type: type, userData: userData, hintText: hintText);
}

class InputFieldState extends State<InputField> {
  InputFieldState({this.title, this.type, this.userData, this.hintText});

  final String title;
  final String type;
  final String hintText;
  final LoginUserData userData;
  String errorText;

  @override
  Widget build(BuildContext context) {
    final LoginDataBloc loginDataBloc = BlocProvider.of<LoginDataBloc>(context);

    return TextField(
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(CustomColors.LIGHT_BLUE),
          )
        ),
        suffixIcon: Icon(
            Icons.textsms,
            size: 15.0,
            color: const Color(CustomColors.WHITE),
        ),
        labelText: title,
        hintText: hintText,
        errorText: errorText,
        labelStyle: TextStyleOptions.defaultTitle,
        hintStyle: TextStyleOptions.defaultText,
      ),
      style: TextStyleOptions.defaultText,
      obscureText: type == InputFieldTypes.PASSWORD,
      onChanged: (String changedData) {
        loginDataBloc.clearErrorMessage();
        _clearInputErrorText();

        if (type == InputFieldTypes.PASSWORD) {
          userData.password = changedData;
          _validatePasswordField(changedData);
          return;
        }

        userData.email = changedData;
        _validateEmailField(changedData);
      },
    );
  }

  void _validatePasswordField(String data) {
    if (data.isEmpty == false) {
      return;
    }
    _setInputFieldState(AppLocalizations.of(context).translate('EMPTY_PASSWORD'));
  }

  void _validateEmailField(String data) {
    if (data.isEmpty == true) {
      _setInputFieldState(AppLocalizations.of(context).translate('EMPTY_EMAIL'));
      return;
    }

    final bool emailValid = RegExp(RegularExpressions.EMAIL).hasMatch(data);

    if (emailValid == false) {
      _setInputFieldState(AppLocalizations.of(context).translate('MALFORMED_EMAIL'));
    }
  }

  void _clearInputErrorText() {
    _setInputFieldState(null);
  }

  void _setInputFieldState(String data) {
    setState(() {
      errorText = data;
    });
  }
}
