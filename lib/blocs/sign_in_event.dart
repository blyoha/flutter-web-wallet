import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInEvent {}

// When user enters their phone number and presses "Send code"
class SignInCodeSentEvent extends SignInEvent {
  final String phoneNumber;

  SignInCodeSentEvent({required this.phoneNumber});

  List<Object> get props => [phoneNumber];
}

// When user enters the sent code and presses "Confirm"
class SignInVerifiedSentCodeEvent extends SignInEvent {
  final String smsCode;
  final String verificationId;

  SignInVerifiedSentCodeEvent(
      {required this.smsCode, required this.verificationId});

  List<Object> get props => [smsCode, verificationId];
}

// When Firebase sends a code to a user's phone (user awaits the code).
class SignInFirebaseCodeSentEvent extends SignInEvent {
  final String verificationId;
  final int? token;

  SignInFirebaseCodeSentEvent(
      {required this.verificationId, required this.token});

  List<Object> get props => [verificationId];
}

// When the sent code is entered and user signs in
class SignInCompletedEvent extends SignInEvent {
  final AuthCredential credential;

  SignInCompletedEvent({required this.credential});
}

// When something goes wrong and uses gets an error.
class SignInErrorEvent extends SignInEvent {
  final String error;

  SignInErrorEvent({required this.error});

  List<Object> get props => [error];
}
