import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_events.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_states.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_handler/sign_up_handler.dart';

class SignUpScreenBloc extends Bloc<SignUpEvents, SignUpStates> {
  SignUpScreenBloc() : super(SignUpStates()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));

    });
    on<PasswordEvent>((event,emit){
      emit(state.copyWith(password: event.password));
    });
  }
}
