import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_wallet/blocs/registration_event.dart';
import 'package:web_wallet/blocs/registration_states.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitialState()) {
    on<CodeSentEvent>((event, emit) {
      emit(RegistrationCodeSentState());
    });

    on<ConfirmedEvent>((event, emit) => null);
  }
}
