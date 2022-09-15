import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: NumPad(controller: _numberController),
          )
        ]));
  }

  _buildNumberInput() {
    var formatter = FilteringTextInputFormatter.allow(RegExp(r'[a-b]'));

    return Row(children: [
      AppContainer(child: Text("+7", style: AppTexts.numberStyle)),
      const SizedBox(width: 10),
      Expanded(
          child: AppContainer(
              child: Center(
                  child: TextField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          isDense: true),
                      inputFormatters: [formatter],
                      controller: _numberController,
                      textAlign: TextAlign.center,
                      showCursor: false,
                      style: AppTexts.numberStyle,
                      keyboardType: TextInputType.none))))
    ]);
  }
}
