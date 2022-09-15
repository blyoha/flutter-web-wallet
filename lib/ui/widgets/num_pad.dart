import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class NumPad extends StatelessWidget {
  final TextEditingController controller;

  const NumPad({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 18, children: [
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
                child: Icon(Icons.backspace_outlined,
                    color: AppColors.textColor1)))
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
