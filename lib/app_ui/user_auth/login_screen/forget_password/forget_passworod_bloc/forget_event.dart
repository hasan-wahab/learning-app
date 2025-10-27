import 'package:flutter/cupertino.dart';

abstract class ForgetPasswordEvent {}

class ForgetPasswordSendEmailEvent extends ForgetPasswordEvent {
  final String email;
  ForgetPasswordSendEmailEvent({required this.email});
}

class ForgetPasswordSendLoadingEvent extends ForgetPasswordEvent {
  final bool isLoading;
  ForgetPasswordSendLoadingEvent({required this.isLoading});
}

class ForgetPasswordSendErrorEvent extends ForgetPasswordEvent {
  final String error;
  ForgetPasswordSendErrorEvent({required this.error});
}

// class ForgetPasswordSendEmailController extends ForgetPasswordEvent {
//   TextEditingController controller;
//   ForgetPasswordSendEmailController({required this.controller});
// }
