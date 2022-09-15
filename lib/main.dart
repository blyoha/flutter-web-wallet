import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_wallet/ui/pages/login_page.dart';

import 'constants/constants.dart';

void main() {
  runApp(const WebMoneyApp());
}

class WebMoneyApp extends StatelessWidget {
  const WebMoneyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.backgroundColor));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebMoney',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        fontFamily: 'Gilroy',
        textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white, fontSize: 16)),
        primarySwatch: Colors.deepPurple,
      ),
      home: const LoginPage(),
    );
  }
}
