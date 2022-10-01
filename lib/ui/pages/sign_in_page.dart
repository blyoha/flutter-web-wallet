import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/sign_in_bloc.dart';
import '../../blocs/sign_in_state.dart';
import '../widgets/content_blocks/activation_code.dart';
import '../widgets/content_blocks/welcome_content.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _numberController = TextEditingController();

  late bool codeSent = false;

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocListener<SignInBloc, SignInState>(
                listener: (context, state) {
      // When the OTP is verified and user is logged in
      if (state is SignInVerifiedState) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Container()));
      }
      // When user isn't logged in
      if (state is SignInErrorState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.error)));
      }
    }, child: BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return _buildContent(state);
    }))));
  }

  _buildContent(state) {
    const String icon = "assets/icons/webmoney-icon.png";

    if (state is SignInLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 50),
          Image.asset(icon, width: 55, height: 55),
          const SizedBox(height: 80),
          SizedBox(
              height: 310,
              child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                if (state is SignInInitialState) {
                  return WelcomeContent(numberController: _numberController);
                }
                if (state is SignInCodeSentSuccessfulState) {
                  return const ActivationCode();
                }
                // if (state is SignInErrorState) {
                //   return Center(
                //       child: Text("Couldn't send code.",
                //           style: AppTexts.headerStyle));
                // }
                return Container();
              }))
          // Removed custom NumPad due to the fact of text formatter unavailability.
          //
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 15),
          //   child: NumPad(controller: _numberController),
          // )
        ]));
  }
}
