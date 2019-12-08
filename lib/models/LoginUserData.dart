class LoginUserData {
  LoginUserData(
      this.email,
      this.password,
      this.errorMessage,
      this.loginSuccess,
      this.signUpSuccess,
      this.resetPasswordSuccess,
  );

  LoginUserData.empty() {
    email = '';
    password = '';
    errorMessage = null;
    loginSuccess = false;
    signUpSuccess = false;
    resetPasswordSuccess = false;
  }

  String email;
  String password;
  String errorMessage;
  bool loginSuccess;
  bool signUpSuccess;
  bool resetPasswordSuccess;
}