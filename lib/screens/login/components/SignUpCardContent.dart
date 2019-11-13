import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
                child: Text('Do you want to sign up to the Community?')
            ),
            RaisedButton(
              child: Text('Sign Up!'),
              color: Color(0xffb2bec3),
              onPressed: (){},
            )
          ],
        )
    );
  }
}