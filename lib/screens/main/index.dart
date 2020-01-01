import 'package:flutter/material.dart';
import 'package:test_app/components/buttons/PrimaryButton.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/fileLocation.dart';
import 'package:test_app/shared/const/routes.dart';
import 'package:test_app/shared/const/textStyleOptions.dart';

class MainScreen extends StatelessWidget {
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
                top: 100.0
              ),
              height: 250.0,
              child: Image.asset(FileLocations.LOGO),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 0.0),
              child: Text(
                AppLocalizations.of(context).translate('SUCCESSFUL_LOGIN'),
                style: TextStyleOptions.loginTitle,
              )
            ),
            Container(
              padding: const EdgeInsets.all(40.0),
              child: PrimaryButton(
                color: const Color(CustomColors.WHITE),
                buttonText: AppLocalizations.of(context).translate('BACK_TO_HOME'),
                onPressed: (){
                  Navigator.pushNamed(context, Routes.HOME);
                },
              ),
            )
          ],
        )
      ),
    );
  }
}