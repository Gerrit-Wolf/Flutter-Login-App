import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/shared/const/routes.dart';

class SignUpCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                AppLocalizations.of(context).translate('SIGN_UP_INFO'),
              ),
            ),
            RaisedButton(
              child: Text(
                AppLocalizations.of(context).translate('SIGN_UP'),
              ),
              color: const Color(0xffb2bec3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              onPressed: (){
                Navigator.pushNamed(context, Routes.SIGN_UP);
              },
            )
          ],
        )
    );
  }
}