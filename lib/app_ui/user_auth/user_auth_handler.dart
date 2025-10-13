import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_events.dart';

class UserAuthHandler {
  UserAuthHandler._();
  static  userSignUp({required BuildContext context}) async {
    var bloc = context.read<SignUpScreenBloc>();
    final state = context.read<SignUpScreenBloc>().state;
    FirebaseAuth auth = FirebaseAuth.instance;

    if (state.email == '' || state.password == '') {
      bloc.add(ErrorEvent(errorMsg: 'Enter required fields'));
    } else if (state.isAgree == false &&
        state.email != '' &&
        state.password != '') {
      bloc.add(ErrorEvent(errorMsg: 'Please agree to the Terms & Conditions before signing up.'));
    } else {
      try {
        bloc.add(LoadingEvent(isLoading: true));
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
        await user.user!.sendEmailVerification().then((value) {
          bloc.add(LoadingEvent(isLoading: false));
          bloc.add(AgreeWithTermsAndConditionEvent(isAgree: false));
          bloc.add(
            ErrorEvent(
              errorMsg:
                  'Please check your email inbox to follow the link and verify you email.',
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        bloc.add(LoadingEvent(isLoading: false));
        final String error = e.code.toString();
        if (error == 'invalid-email') {
          // The email address is badly formatted.
          bloc.add(
            ErrorEvent(errorMsg: 'The email address is badly formatted.'),
          );
        } else if (error == 'network-request-failed') {
          //
          return bloc.add(
            ErrorEvent(errorMsg: 'Check your internet connection'),
          );
        } else if (error == 'unknown') {
          // An internal error has occurred.
          return bloc.add(
            ErrorEvent(errorMsg: 'Please check internet connection'),
          );
        } else if (error == 'email-already-in-use') {
          // The email address is already in use by another account.
           bloc.add(
            ErrorEvent(
              errorMsg:
                  'The email address is already in use by another account.',
            ),
          );
        } else {
          return bloc.add(ErrorEvent(errorMsg: e.code.toString()));
        }
      }
    }
  }

  static userLogIn(){

  }
}
