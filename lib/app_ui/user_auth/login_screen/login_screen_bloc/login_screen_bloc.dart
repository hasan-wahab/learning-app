import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodi/app_ui/user_auth/login_screen/login_screen_bloc/login_screen_events.dart';
import 'package:foodi/app_ui/user_auth/login_screen/login_screen_bloc/login_sreen_states.dart';

class LoginScreenBloc extends Bloc<LoginEvent, LoginState> {
  LoginScreenBloc() : super(LoginState()) {
    on<LoginEmailEvent>((event, emit) {
      emit(
        state.copyWith(
          email: event.email,
          errorMsg: state.errorMsg,
          isLoading: state.isLoading,
          obscureText: state.obscureText,
          password: state.password,
        ),
      );
      print(state.email);
    });

    on<LoginPasswordEvent>((event, emit) {
      emit(
        state.copyWith(
          password: event.password,
          email: state.email,
          errorMsg: state.errorMsg,
          obscureText: state.obscureText,
          isLoading: state.isLoading,
        ),
      );
      print(state.password);
    });

    on<LoginErrorEvent>((event, emit) {
      emit(
        state.copyWith(
          errorMsg: event.errorMsg,
          email: state.email,
          password: state.password,
          isLoading: state.isLoading,
          obscureText: state.obscureText,
        ),
      );
      print(state.errorMsg);
    });

    on<LoginObscureTextEvent>((event, emit) {
      emit(
        state.copyWith(
          obscureText: event.obscureText,
          isLoading: state.isLoading,
          password: state.password,
          email: state.email,
          errorMsg: state.errorMsg,
        ),
      );
    });

    on<LoginLoadingEvent>((event, emit) {
      emit(
        state.copyWith(
          isLoading: event.isLoading,
          errorMsg: state.errorMsg,
          email: state.email,
          password: state.password,
          obscureText: state.obscureText,
        ),
      );
    });
  }
}
