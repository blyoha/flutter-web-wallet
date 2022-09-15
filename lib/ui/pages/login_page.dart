import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_wallet/constants/constants.dart';

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

class AppContainer extends StatelessWidget {
  Widget? child;

  AppContainer({Key? key, this.child}) : super(key: key);

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

class NumPad extends StatelessWidget {
  final TextEditingController controller;

  const NumPad({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 18,
        children: [
      Row(children: [
        for (var val = 1; val < 4; val++)
          NumberButton(number: val.toString(), controller: controller)
      ]),
      Row(children: [
        for (var val = 4; val < 7; val++)
          NumberButton(number: val.toString(), controller: controller)
      ]),
      Row(children: [
        for (var val = 7; val < 10; val++)
          NumberButton(number: val.toString(), controller: controller)
      ]),
      Row(children: [
        NumberButton(number: "*", controller: controller),
        NumberButton(number: "0", controller: controller),
        Expanded(
          child: MaterialButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                if (controller.text.isEmpty) {
                  return;
                }

                String text = controller.text;
                controller.text = text.substring(0, text.length - 1);
              },
              child:
                  Icon(Icons.backspace_outlined, color: AppColors.textColor1)),
        )
      ])
    ]);
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final TextEditingController controller;

  const NumberButton({Key? key, required this.number, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MaterialButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            textColor: AppColors.textColor1,
            onPressed: () {
              controller.text += number;
            },
            child: Center(child: Text(number, style: AppTexts.numberStyle))));
  }
}
