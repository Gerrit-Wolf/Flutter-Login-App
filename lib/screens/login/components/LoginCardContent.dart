import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginDataBloc.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/widgets/BlocProvider.dart';
import '../../../components/inputField/InputField.dart';
import '../../../components/inputField/const/InputFieldTypes.dart';
import 'ForgotPasswordButton.dart';
import 'LoginButton.dart';

class LoginCardContent extends StatelessWidget {
  final LoginUserData userData = LoginUserData.empty();

  @override
  Widget build(BuildContext context) {
    final LoginDataBloc loginDataBloc = BlocProvider.of<LoginDataBloc>(context);

    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5.0),
          child: InputField(
              title: AppLocalizations.of(context).translate('EMAIL'),
              type: InputFieldTypes.EMAIL,
              userData: userData,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: InputField(
              title: AppLocalizations.of(context).translate('PASSWORD'),
              type: InputFieldTypes.PASSWORD,
              userData: userData,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            width: double.infinity,
            child: LoginButton(
              userData: userData,
            )
        ),
        Container(
          alignment: Alignment.centerRight,
          child: ForgotPasswordButton(),
        ),
        StreamBuilder<String>(
          stream: loginDataBloc.outErrorMessage,
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Visibility(
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  color: Colors.redAccent,
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        snapshot.data ?? '',
                        style: TextStyle(
                            color: Colors.black
                        ),
                      )
                  )
              ),
              visible: snapshot.data != null,
            );
          }
        ),
        StreamBuilder<bool>(
          stream: loginDataBloc.outLoading,
          initialData: false,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return const CircularProgressIndicator();
            }
            return const SizedBox(
                height: 0.0
            );
          },
        )
      ],
    );
  }
}