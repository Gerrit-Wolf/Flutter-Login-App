class LoginUserData {
  LoginUserData(this.email, this.password, this.errorMessage);

  LoginUserData.empty() {
    email = '';
    password = '';
    errorMessage = null;
  }

  String email;
  String password;
  String errorMessage;
}