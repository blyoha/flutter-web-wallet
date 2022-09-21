import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../constants/constants.dart';

class AppInput extends StatelessWidget {
  // final TextEditingController numberController;
  final TextInputAction action;
  late MaskTextInputFormatter? mask;

  AppInput({Key? key, this.mask, this.action = TextInputAction.done})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    mask ??= MaskTextInputFormatter();

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.secondaryColor),
        child: TextField(
            // controller: numberController,
            enableInteractiveSelection: false,
            keyboardType: TextInputType.number,
            style: AppTexts.numberStyle,
            textAlign: TextAlign.center,
            showCursor: false,
            autofocus: true,
            textInputAction: action,
            inputFormatters: [mask!],
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: AppColors.focusColor, width: 2)),
                border: InputBorder.none)));
  }
}
