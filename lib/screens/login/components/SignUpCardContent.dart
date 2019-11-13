import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Center(
                child: const Text('Do you want to sign up to the Community?')
            ),
            RaisedButton(
              child: const Text('Sign Up!'),
              color: const Color(0xffb2bec3),
              onPressed: (){
                Navigator.pushNamed(context, '/signUp');
              },
            )
          ],
        )
    );
  }
}