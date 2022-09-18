import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:web_wallet/constants/constants.dart';

import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _numberController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildContent()));
  }

  _buildContent() {
    const String description =
        "Please confirm the country code and enter your phone number";
    const String icon = "assets/icons/webmoney-icon.png";

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 50),
          Image.asset(icon, width: 55, height: 55),
          const SizedBox(height: 80),
          Text("Welcome!", style: AppTexts.headerStyle),
          Container(
            width: 250,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(description, style: AppTexts.secondaryStyle),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: _buildNumberInput()),
          AppButton(text: "Send Code"),
          // Removed custom NumPad due to the fact of text formatter unavailability.
          //
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 15),
          //   child: NumPad(controller: _numberController),
          // )
        ]));
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
                      controller: _numberController,
                      textAlign: TextAlign.center,
                      style: AppTexts.numberStyle))))
    ]);
  }
}
