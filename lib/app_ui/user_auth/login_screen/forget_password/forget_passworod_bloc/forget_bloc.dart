import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodi/app_ui/user_auth/login_screen/forget_password/forget_passworod_bloc/forget_event.dart';
import 'package:foodi/app_ui/user_auth/login_screen/forget_password/forget_passworod_bloc/forget_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordState()) {
    on<ForgetPasswordSendEmailEvent>((event, emit) {
      emit(
        state.copyWith(
          email: event.email,
          error: '',
          isLoading: false,
         // controller: state.controller,
        ),
      );
    });
    on<ForgetPasswordSendErrorEvent>((event, emit) {
      emit(
        state.copyWith(
          error: event.error,
          email: state.email,
          isLoading: state.isLoading,
         // controller: state.controller,
        ),
      );
    });
    on<ForgetPasswordSendLoadingEvent>((event, emit) {
      emit(
        state.copyWith(
          email: state.email,
          error: state.error,
          isLoading: event.isLoading,
        //  controller: state.controller,
        ),
      );
    });
    // on<ForgetPasswordSendEmailController>((event, emit) {
    //   emit(
    //     state.copyWith(
    //       controller: event.controller,
    //       error: state.error,
    //       email: state.email,
    //       isLoading: state.isLoading,
    //     ),
    //   );
    // });
  }
}
