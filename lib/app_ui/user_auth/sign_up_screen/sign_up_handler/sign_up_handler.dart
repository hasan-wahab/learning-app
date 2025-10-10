import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodi/app_ui/user_auth/sign_up_screen/sign_up_bloc/sign_up_states.dart';

class SignUpHandler {
  signUpFunc({required String email, required String password}) {
    print(email);
    print(password);
  }
}
