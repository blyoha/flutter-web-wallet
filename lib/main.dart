import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/constants.dart';
import 'firebase_options.dart';
import 'ui/pages/sign_in_page.dart';

void main() async {
  // Connect to Firebase app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const WebWalletApp());
}

class WebWalletApp extends StatelessWidget {
  const WebWalletApp({Key? key}) : super(key: key);

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
        primarySwatch: Colors.deepPurple
      ),
      home: RegistrationPage(),
    );
  }
}
