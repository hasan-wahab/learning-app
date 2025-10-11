class SignUpEvents {}

class EmailEvent extends SignUpEvents {
  String email;

  EmailEvent({required this.email});
}

class PasswordEvent extends SignUpEvents {
  String password;

  PasswordEvent({required this.password});
}

class ErrorEvent extends SignUpEvents {
  String errorMsg;
  ErrorEvent({required this.errorMsg});
}

class LoadingEvent extends SignUpEvents {
  bool isLoading;
  LoadingEvent({required this.isLoading});
}

class AgreeWithTermsAndConditionEvent extends SignUpEvents {
  bool isAgree;

  AgreeWithTermsAndConditionEvent({required this.isAgree});
}
