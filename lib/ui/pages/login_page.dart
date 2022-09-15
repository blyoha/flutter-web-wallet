import 'package:flutter/material.dart';
import 'package:web_wallet/constants/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
          const SizedBox(height: 80),
          Image.asset(icon, width: 64, height: 64),
          const SizedBox(height: 80),
          Text("Welcome!", style: AppTexts.headerStyle),
          Container(
            width: 250,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(description, style: AppTexts.secondaryStyle),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                UniContainer(child: Text("+7", style: AppTexts.numberStyle)),
                const SizedBox(width: 10),
                Expanded(
                  child: UniContainer(
                      child: Center(
                          child: Text("999 644 40 50",
                              style: AppTexts.numberStyle))),
                )
              ],
            ),
          ),
          AppButton(text: "Send Code")
        ]));
  }
}

class UniContainer extends StatelessWidget {
  Widget? child;

  UniContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.secondaryColor),
        child: child);
  }
}

class AppButton extends StatelessWidget {
  String text;

  AppButton({Key? key, this.text = ""}) : super(key: key);

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
        onPressed: null,
        child: Text(text, style: AppTexts.primaryStyle));
  }
}
