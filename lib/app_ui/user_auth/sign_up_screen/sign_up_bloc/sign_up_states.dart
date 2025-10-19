class SignUpStates {
  final String username;
  final String email;
  final String password;
  final String errorMsg;
   bool isLoading;
   bool isAgree;
   bool obscureText;

  SignUpStates({
    this.username='',
    this.email = '',
    this.password = '',
    this.errorMsg = '',
    this.isLoading = false,
    this.isAgree =false,
    this.obscureText=true,
  });

  SignUpStates copyWith({
    String? username,
    String? email,
    String? password,
    String? errorMsg,
    bool isLoading = false,
    bool isAgree=false,
    bool obscureText=true,
  }) {
    return SignUpStates(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMsg: errorMsg ?? this.errorMsg,
      isLoading: isLoading,
      isAgree: isAgree,
      obscureText: obscureText,
    );
  }
}
