import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class AppButton extends StatelessWidget {
  Function? onPressed;
  String text;

  AppButton({Key? key, this.onPressed, this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.focusColor),
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 70))),
        onPressed: () {
          onPressed!();
        },
        child: Text(text, style: AppTexts.primaryStyle));
  }
}
