import 'package:flutter/material.dart';
import 'components/LoginCardContent.dart';

class LoginScreenScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                color: Colors.indigoAccent,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                )
            ),
            Card(
                color: Colors.white,
                margin: EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 1.0,
                    ),
                  ),
                  child: LoginCardContent(),
                )
            )
          ],
        ),
      )
    );
  }
}