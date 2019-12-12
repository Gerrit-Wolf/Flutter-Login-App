class LoginUserData {
  LoginUserData(
      this.email,
      this.password,
      this.loginSuccess,
      this.signUpSuccess,
      this.resetPasswordSuccess,
  );

  LoginUserData.empty() {
    email = '';
    password = '';
    loginSuccess = false;
    signUpSuccess = false;
    resetPasswordSuccess = false;
  }

  String email;
  String password;
  bool loginSuccess;
  bool signUpSuccess;
  bool resetPasswordSuccess;
}