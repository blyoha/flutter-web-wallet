import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/sign_in_bloc.dart';
import '../../blocs/sign_in_state.dart';
import '../../constants/constants.dart';
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const Center(child: Text("Logged in!"))));
                  }
                  // When user isn't logged in
                  if (state is SignInErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                child: _buildContent())));
  }

  _buildContent() {
    const String icon = "assets/icons/webwallet-icon.png";

    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      if (state is SignInLoadingState) {
        return Center(
            child: CircularProgressIndicator(color: AppColors.focusColor));
      }
      // Header
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    return ActivationCode(verificationId: state.verificationId);
                  }
                  return Container();
                }))
            // Removed custom NumPad due to the fact of text formatter unavailability.
            //
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 15),
            //   child: NumPad(controller: _numberController),
            // )
          ]));
    });
  }
}
