import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/sign_in_repository.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  // Create Firebase instance for the authorization.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final SignInRepository signInRepository;

  SignInBloc({required this.signInRepository}) : super(SignInInitialState()) {
    on<SignInCodeSentEvent>(sendCode);

    on<SignInVerifiedSentCodeEvent>(completeAuth);

    on<SignInFirebaseCodeSentEvent>((event, emit) => emit(
        SignInCodeSentSuccessfulState(verificationId: event.verificationId)));

    on<SignInCompletedEvent>(signIn);

    on<SignInErrorEvent>(
        (event, emit) => emit(SignInErrorState(error: event.error)));
  }

  Future<void> sendCode(
      SignInCodeSentEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());
    try {
      await signInRepository.verifyPhone(
          phoneNumber: event.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {
            add(SignInCompletedEvent(credential: credential));
          },
          verificationFailed: (FirebaseAuthException exception) {
            add(SignInErrorEvent(error: exception.code));
          },
          codeSent: (String verificationId, int? token) {
            add(SignInFirebaseCodeSentEvent(
                verificationId: verificationId, token: token));
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      emit(SignInErrorState(error: e.toString()));
    }
  }

  Future<void> completeAuth(
      SignInVerifiedSentCodeEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: event.verificationId, smsCode: event.smsCode);

      add(SignInCompletedEvent(credential: credential));
    } catch (e) {
      emit(SignInErrorState(error: e.toString()));
    }
  }

  Future<void> signIn(
      SignInCompletedEvent event, Emitter<SignInState> emit) async {
    try {
      await _auth.signInWithCredential(event.credential).then((user) {
        if (user.user != null) {
          emit(SignInVerifiedState());
        }
      });
    } on FirebaseAuthException catch (exception) {
      emit(SignInErrorState(error: exception.code));
    } catch (e) {
      emit(SignInErrorState(error: e.toString()));
    }
  }
}
