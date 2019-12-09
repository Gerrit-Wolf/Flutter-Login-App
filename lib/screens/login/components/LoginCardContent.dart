import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginUserDataBloc.dart';
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
    final LoginUserDataBloc userDataBloc = BlocProvider.of<LoginUserDataBloc>(context);

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
        StreamBuilder<LoginUserData>(
          stream: userDataBloc.outUserData,
          initialData: LoginUserData.empty(),
          builder: (BuildContext context, AsyncSnapshot<LoginUserData> snapshot) {
            return Visibility(
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  color: Colors.redAccent,
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        snapshot.data.errorMessage ?? '',
                        style: TextStyle(
                            color: Colors.black
                        ),
                      )
                  )
              ),
              visible: snapshot.data.errorMessage != null,
            );
          }
        )
      ],
    );
  }
}