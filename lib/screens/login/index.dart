import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginDataBloc.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/fileLocation.dart';
import 'package:test_app/widgets/BlocProvider.dart';
import 'components/LoginContent.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(FileLocations.BACKGROUND_SKY),
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
                color: const Color(CustomColors.GREY).withAlpha(30),
              ),
              margin: const EdgeInsets.only(top: 50.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: BlocProvider<LoginDataBloc>(
                  child: LoginContent(),
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