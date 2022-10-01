abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInCodeSentSuccessfulState extends SignInState {
  final String verificationId;

  SignInCodeSentSuccessfulState({required this.verificationId});

  List<Object> get props => [verificationId];
}

class SignInVerifiedState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String error;

  SignInErrorState({required this.error});

  List<Object> get props => [error];
}
