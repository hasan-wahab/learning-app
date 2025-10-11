class SignUpStates {
  final String email;
  final String password;
  final String errorMsg;
  final bool isLoading;
  final bool isAgree;

  SignUpStates({
    this.email = '',
    this.password = '',
    this.errorMsg = '',
    this.isLoading = false,
    this.isAgree =false,
  });

  SignUpStates copyWith({
    String? email,
    String? password,
    String? errorMsg,
    bool isLoading = false,
    bool isAgree=false,
  }) {
    return SignUpStates(
      email: email ?? this.email,
      password: password ?? this.password,
      errorMsg: errorMsg ?? this.errorMsg,
      isLoading: isLoading,
      isAgree: isAgree,
    );
  }
}
