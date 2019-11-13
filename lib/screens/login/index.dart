import 'package:flutter/material.dart';
import 'components/SignUpCardContent.dart';
import 'components/LoginCardContent.dart';

class LoginScreenScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffeccc68),
              Color(0xffff6b81)
            ]
          )
        ),
        child: ListView(
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
              height: 250.0,
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
              color: Color(0Xffffeaa7),
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: LoginCardContent(),
              )
            ),
            Card(
              margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 50.0, bottom: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
              color: Color(0Xffffeaa7),
              child: SignUpCardContent(),
            )
          ],
        ),
      )
    );
  }
}