import 'package:flutter/material.dart';

class AppColors {
  static Color textColor1 = const Color.fromRGBO(255, 255, 255, 1);
  static Color textColor2 = const Color.fromRGBO(150, 150, 150, .3);

  static Color primaryColor = const Color.fromRGBO(12, 16, 25, 1);
  static Color secondaryColor = const Color.fromRGBO(23, 41, 69, 1);

  static Color backgroundColor = const Color.fromRGBO(13, 20, 30, 1);

  static Color focusColor = const Color.fromRGBO(54, 155, 237, 1);
}

class AppTexts {
  static TextStyle primaryStyle =
      TextStyle(color: AppColors.textColor1, fontSize: 18);
  static TextStyle secondaryStyle =
      TextStyle(color: AppColors.textColor2, fontSize: 15);
  static TextStyle headerStyle = TextStyle(
      color: AppColors.textColor1, fontSize: 38, fontWeight: FontWeight.bold);
  static TextStyle numberStyle =
      TextStyle(color: AppColors.textColor1, fontSize: 30);
}
