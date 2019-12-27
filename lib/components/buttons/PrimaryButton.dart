import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({this.color, this.buttonText, this.onPressed});

  final Color color;
  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        buttonText
      ),
      color: color,
      onPressed: onPressed,
      minWidth: 250.0,
      height: 47.0,
    );
  }
}