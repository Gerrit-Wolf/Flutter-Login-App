import 'package:flutter/cupertino.dart';
import 'colors.dart';

class TextStyleOptions {
  static const TextStyle defaultTitle = TextStyle(
    fontFamily: 'Arial',
    fontSize: 18,
    color: Color(CustomColors.WHITE),
  );

  static const TextStyle defaultText = TextStyle(
    fontFamily: 'Arial',
    fontSize: 14,
    color: Color(CustomColors.WHITE),
  );

  static const TextStyle loginTitle = TextStyle(
    fontFamily: 'Arial Rounded MT',
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Color(CustomColors.YELLOW),
  );

  static const TextStyle loginText = TextStyle(
    fontFamily: 'Bodoni MT',
    fontSize: 16,
    color: Color(CustomColors.WHITE),
  );
}