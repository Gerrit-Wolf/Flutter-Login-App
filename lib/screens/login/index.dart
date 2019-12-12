import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginDataBloc.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/fileLocation.dart';
import 'package:test_app/widgets/BlocProvider.dart';
import 'components/LoginCardContent.dart';
import 'components/SignUpCardContent.dart';

class LoginScreenScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: const <Color>[
              Color(CustomColors.YELLOW),
              Color(CustomColors.PINK)
            ]
          )
        ),
        child: ListView(
          children: <Widget>[
            Image(
              image: const AssetImage(FileLocations.LOGO),
              height: 250.0,
            ),
            Card(
              margin: const EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
              color: const Color(CustomColors.LIGHT_YELLOW),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: BlocProvider<LoginDataBloc>(
                  child: LoginCardContent(),
                  bloc: LoginDataBloc(),
                )
              )
            ),
            Card(
              margin: const EdgeInsets.only(
                  right: 10.0,
                  left: 10.0,
                  top: 50.0,
                  bottom: 10.0
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
              color: const Color(CustomColors.LIGHT_YELLOW),
              child: SignUpCardContent(),
            )
          ],
        ),
      )
    );
  }
}