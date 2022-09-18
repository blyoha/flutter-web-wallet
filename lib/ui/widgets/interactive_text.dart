import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class InteractiveText extends StatelessWidget {
  final String text;

  const InteractiveText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Text(text, style: AppTexts.interactiveStyle));
  }
}
