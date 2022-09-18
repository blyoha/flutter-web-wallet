import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'widgets.dart';

class ActivationCode extends StatelessWidget {
  const ActivationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Text("Enter activation code", style: AppTexts.primaryStyle)),
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: _buildCodeInput()),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("A code has been sent to your phone",
              style: AppTexts.secondaryStyle),
          const SizedBox(height: 10),
          const InteractiveText(text: "Request code again")
        ]),
      ),
      AppButton(text: "Confirm")
    ]);
  }

  _buildCodeInput() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _buildDigitInput(),
      const SizedBox(width: 10),
      _buildDigitInput(),
      const SizedBox(width: 10),
      _buildDigitInput(),
      const SizedBox(width: 10),
      _buildDigitInput()
    ]);
  }

  _buildDigitInput() {
    return Expanded(child: AppContainer(child: TextField()));
  }
}
