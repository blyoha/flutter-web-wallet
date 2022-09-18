import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../constants/constants.dart';
import 'widgets.dart';

class WelcomeContent extends StatelessWidget {
  final TextEditingController numberController;

  const WelcomeContent({Key? key, required this.numberController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String description =
        "Please confirm the country code and enter your phone number";

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Welcome!", style: AppTexts.headerStyle),
      Container(
        width: 250,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(description, style: AppTexts.secondaryStyle),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: _buildNumberInput()),
      AppButton(text: "Send Code")
    ]);
  }

  _buildNumberInput() {
    var maskFormatter = MaskTextInputFormatter(
        mask: "### ### ## ##", filter: {"#": RegExp(r"[0-9]")});

    return Row(children: [
      AppContainer(child: Text("RU +7", style: AppTexts.numberStyle)),
      const SizedBox(width: 10),
      Expanded(
          child: AppContainer(
              child: Center(
                  child: TextField(
                      keyboardType: TextInputType.number,
                      showCursor: false,
                      autofocus: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          isDense: true),
                      inputFormatters: [maskFormatter],
                      controller: numberController,
                      textAlign: TextAlign.center,
                      style: AppTexts.numberStyle))))
    ]);
  }
}
