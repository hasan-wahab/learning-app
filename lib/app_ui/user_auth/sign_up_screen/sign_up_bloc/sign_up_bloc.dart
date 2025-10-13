import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_events.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_states.dart';

class SignUpScreenBloc extends Bloc<SignUpEvents, SignUpStates> {
  SignUpScreenBloc() : super(SignUpStates()) {
    on<EmailEvent>((event, emit) {
      emit(
        state.copyWith(
          email: event.email,
          errorMsg: '',
          isAgree: state.isAgree,
          isLoading: false,
          obscureText: state.obscureText,
        ),
      );
      print(state.email);
      print(state.isAgree);
    });
    on<PasswordEvent>((event, emit) {
      emit(
        state.copyWith(
          password: event.password,
          errorMsg: '',
          isAgree: state.isAgree,
          isLoading: false,
          obscureText: state.obscureText,
        ),
      );
      print(state.password);
      print(state.isAgree);
    });
    on<ErrorEvent>((event, emit) {
      if (state.password.isEmpty || state.email.isEmpty) {
        emit(
          state.copyWith(
            errorMsg: event.errorMsg,
            isAgree: state.isAgree,
            isLoading: false,
            obscureText: state.obscureText,
          ),
        );
        print(state.errorMsg);
      } else {
        emit(
          state.copyWith(
            errorMsg: event.errorMsg,
            isAgree: state.isAgree,
            isLoading: false,
            obscureText: state.obscureText,
          ),
        );
        print('${state.errorMsg} 2nd');
      }
    });
    on<LoadingEvent>((event, emit) {
      emit(
        state.copyWith(
          isLoading: event.isLoading,
          errorMsg: '',
          isAgree: state.isAgree,
          obscureText: state.obscureText,
        ),
      );
      print(state.isLoading);
    });
    on<AgreeWithTermsAndConditionEvent>((event, emit) {
      emit(
        state.copyWith(
          isAgree: event.isAgree,
          errorMsg: '',
          isLoading: false,
          obscureText: state.obscureText,
        ),
      );
      print(state.isAgree);
    });
    on<ObscureTextEvent>((event, emit) {
      emit(state.copyWith(obscureText: event.obscureText,isAgree: state.isAgree,isLoading: state.isLoading),);
    });
  }
}
