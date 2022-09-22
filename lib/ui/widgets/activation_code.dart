import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
      _buildCodeInput(context),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("A code has been sent to your phone",
            style: AppTexts.secondaryStyle),
        const SizedBox(height: 5),
        const InteractiveText(text: "Request code again")
      ]),
      const SizedBox(height: 30),
      AppButton(text: "Confirm")
    ]);
  }

  _buildCodeInput(context) {
    final PinTheme pinTheme = PinTheme(
        fieldWidth: 75,
        fieldHeight: 75,
        shape: PinCodeFieldShape.box,
        activeColor: AppColors.secondaryColor,
        selectedColor: AppColors.focusColor,
        inactiveColor: AppColors.secondaryColor,
        activeFillColor: AppColors.secondaryColor,
        selectedFillColor: AppColors.secondaryColor,
        inactiveFillColor: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(20),
        borderWidth: 2);

    return PinCodeTextField(
        appContext: context,
        length: 4,
        onChanged: (value) {},
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        showCursor: false,
        autoFocus: true,
        autoUnfocus: true,
        textStyle: AppTexts.numberStyle,
        animationType: AnimationType.none,
        enableActiveFill: true,
        pinTheme: pinTheme);
  }
}
