abstract class LoginEvent {}

class LoginEmailEvent extends LoginEvent {
  final String email;
  LoginEmailEvent({required this.email});
}

class LoginPasswordEvent extends LoginEvent {
  final String password;
  LoginPasswordEvent({required this.password});
}

class LoginObscureTextEvent extends LoginEvent {
  bool obscureText;
  LoginObscureTextEvent({required this.obscureText});
}

class LoginErrorEvent extends LoginEvent {
  final String errorMsg;
  LoginErrorEvent({required this.errorMsg});
}

class LoginLoadingEvent extends LoginEvent {
  bool isLoading;
  LoginLoadingEvent({required this.isLoading});
}
