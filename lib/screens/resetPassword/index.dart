import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginDataBloc.dart';
import 'package:test_app/screens/resetPassword/components/ResetPasswordContent.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/fileLocation.dart';
import 'package:test_app/widgets/BlocProvider.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(FileLocations.BACKGROUND_SKY),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 100.0,
              ),
              height: 250.0,
              child: Image.asset(FileLocations.LOGO),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: const Color(CustomColors.BABY_BLUE).withOpacity(0.1),
                    blurRadius: 20.0,
                    spreadRadius: 5.0,
                  )
                ]
              ),
              margin: const EdgeInsets.only(top: 50.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: BlocProvider<LoginDataBloc>(
                  child: ResetPasswordContent(),
                  bloc: LoginDataBloc(),
                )
              )
            ),
          ],
        ),
      )
    );
  }
}