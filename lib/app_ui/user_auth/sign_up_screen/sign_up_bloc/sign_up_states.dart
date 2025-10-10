class SignUpStates{
 final String email;
 final  String password;

  SignUpStates({this.email='',this.password=''});

  SignUpStates copyWith({String? email,String?password}){
    return SignUpStates(

      email: email ?? this.email,
      password: password ?? this.password
    );
  }
}



