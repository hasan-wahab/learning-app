class LoginState {
  final String email;
  final String password;
  final String errorMsg;
  bool isLoading;
  bool obscureText;

  LoginState({
    this.email = '',
    this.password = '',
    this.errorMsg = '',
    this.isLoading = false,
    this.obscureText = true,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? errorMsg,
    bool obscureText = true,
    bool isLoading = false,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      errorMsg: errorMsg ?? this.errorMsg,
      obscureText: obscureText,
      isLoading: isLoading,
    );
  }
}
