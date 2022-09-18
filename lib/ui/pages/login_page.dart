import 'package:flutter/material.dart';

import '../widgets/activation_code.dart';
import '../widgets/welcome_content.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _numberController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _buildContent()));
  }

  _buildContent() {
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
}
