import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

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
