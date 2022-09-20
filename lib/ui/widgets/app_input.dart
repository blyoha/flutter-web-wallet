import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../constants/constants.dart';

class AppInput extends StatelessWidget {
  final TextEditingController numberController;
  final MaskTextInputFormatter
      mask; // MaskTextInputFormatter(mask: "### ### ## ##", filter: {"#": RegExp(r"[0-9]")})

  const AppInput({Key? key, required this.numberController, required this.mask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondaryColor),
      child: TextField(
          keyboardType: TextInputType.number,
          showCursor: false,
          autofocus: true,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      BorderSide(color: AppColors.focusColor, width: 2)),
              border: InputBorder.none),
          inputFormatters: [mask],
          controller: numberController,
          textAlign: TextAlign.center,
          style: AppTexts.numberStyle),
    );
  }
}
