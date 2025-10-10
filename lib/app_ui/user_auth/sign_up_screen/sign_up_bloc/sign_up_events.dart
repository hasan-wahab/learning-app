

class SignUpEvents{}
class EmailEvent extends SignUpEvents{
  String email;


  EmailEvent({required this.email,});
}
class PasswordEvent extends SignUpEvents{
  String password;


  PasswordEvent({required this.password,});
}