import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordState {
  final String email;
  bool isLoading;
  final String error;
//  TextEditingController? controller = TextEditingController();

  ForgetPasswordState({
    this.email = '',
    this.error = '',
    this.isLoading = false,
   // this.controller,
  });

  ForgetPasswordState copyWith({
    String? email,
    bool? isLoading,
    String? error,
    //TextEditingController? controller,
  }) {
    return ForgetPasswordState(
      email: email ?? this.email,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
     // controller: controller ?? this.controller,
    );
  }
}
