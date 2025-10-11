import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_events.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_states.dart';

class SignUpScreenBloc extends Bloc<SignUpEvents, SignUpStates> {
  SignUpScreenBloc() : super(SignUpStates()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
      print(state.email);
    });
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
      print(state.password);
    });
    on<ErrorEvent>((event, emit) {
      emit(state.copyWith(errorMsg: event.errorMsg));
    });
    on<LoadingEvent>((event, emit) {
      emit(state.copyWith(isLoading: event.isLoading));
    });

    on<AgreeWithTermsAndConditionEvent>((event, emit) {
      emit(state.copyWith(isAgree: event.isAgree));
    });
  }
}
