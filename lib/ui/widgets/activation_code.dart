import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../constants/constants.dart';
import 'widgets.dart';

class ActivationCode extends StatelessWidget {
  const ActivationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 18),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Enter activation code", style: AppTexts.primaryStyle)),
      ),
      _buildCodeInput(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("A code has been sent to your phone",
              style: AppTexts.secondaryStyle),
          const SizedBox(height: 5),
          const InteractiveText(text: "Request code again")
        ]),
      ),
      const SizedBox(height: 10),
      AppButton(text: "Confirm")
    ]);
  }

  _buildCodeInput() {
    final mask =
        MaskTextInputFormatter(mask: '#', filter: {'#': RegExp(r'[0-9]')});

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(child: AppInput(mask: mask, action: TextInputAction.next)),
      const SizedBox(width: 15),
      Expanded(child: AppInput(mask: mask, action: TextInputAction.next)),
      const SizedBox(width: 15),
      Expanded(child: AppInput(mask: mask, action: TextInputAction.next)),
      const SizedBox(width: 15),
      Expanded(child: AppInput(mask: mask))
    ]);
  }
}
