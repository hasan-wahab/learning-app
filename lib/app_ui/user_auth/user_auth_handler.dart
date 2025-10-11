import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_events.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_states.dart';

class UserAuthHandler {
  UserAuthHandler._();

  static Future userSignUp({
    required SignUpStates state,
    required BuildContext context,
  }) async {
    final email = state.email;
    final password = state.password;
    var addEvent = context.read<SignUpScreenBloc>();
    FirebaseAuth auth = FirebaseAuth.instance;
    if (email == '' || password == '') {
      // Enter required Fields
      print('Enter required field');
    } else if (state.isAgree == false) {
      addEvent.add(
        ErrorEvent(errorMsg: 'Please select the term and condition'),
      );
    } else {
      try {
        addEvent.add(LoadingEvent(isLoading: true));
        addEvent.add(ErrorEvent(errorMsg:''));
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
              addEvent.add(LoadingEvent(isLoading: false));
              addEvent.add(
                ErrorEvent(errorMsg: 'User has been created with $email'),
              );
            });
      } on FirebaseAuthException catch (e) {
        final String error = e.code.toString();
        if (error == 'invalid-email') {
          // The email address is badly formatted.
          return addEvent.add(
            ErrorEvent(errorMsg: 'The email address is badly formatted.'),
          );
        } else if (error == 'network-request-failed') {
          //
          return addEvent.add(
            ErrorEvent(errorMsg: 'Check your internet connection'),
          );
        } else if (error == 'unknown') {
          // An internal error has occurred.
          return addEvent.add(
            ErrorEvent(errorMsg: 'Please check internet connection'),
          );
        } else if (error == 'email-already-in-use') {
          // The email address is already in use by another account.
          return addEvent.add(
            ErrorEvent(
              errorMsg:
                  'The email address is already in use by another account.',
            ),
          );
        } else {
          return addEvent.add(ErrorEvent(errorMsg: e.code.toString()));
        }
      }
    }
  }
}
