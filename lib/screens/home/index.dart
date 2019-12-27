import 'package:flutter/material.dart';
import 'package:test_app/components/buttons/PrimaryButton.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/fileLocation.dart';
import 'package:test_app/shared/const/routes.dart';
import 'package:test_app/shared/const/textStyleOptions.dart';

class HomeScreen extends StatelessWidget {
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
                  top: 100.0
              ),
              height: 250.0,
              child: Image.asset(FileLocations.LOGO),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 70.0,
                left: 30.0,
                right: 30.0
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).translate('HOME_TITLE'),
                    style: TextStyleOptions.loginTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    AppLocalizations.of(context).translate('HOME_TEXT'),
                    style: TextStyleOptions.loginText,
                    textAlign: TextAlign.center,
                  )
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  PrimaryButton(
                    color: const Color(CustomColors.WHITE),
                    buttonText: AppLocalizations.of(context).translate('LOGIN'),
                    onPressed: (){
                      Navigator.pushNamed(context, Routes.LOGIN);
                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  PrimaryButton(
                    color: const Color(CustomColors.BABY_BLUE),
                    buttonText: AppLocalizations.of(context).translate('REGISTER'),
                    onPressed: (){
                      Navigator.pushNamed(context, Routes.REGISTER);
                    },
                  )
                ]
              )
            )
          ],
        )
      ),
    );
  }
}