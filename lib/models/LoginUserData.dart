class LoginUserData {
  LoginUserData(
      this.email,
      this.password,
      this.loginSuccess,
      this.registerSuccess,
      this.resetPasswordSuccess,
  );

  LoginUserData.empty() {
    email = '';
    password = '';
    loginSuccess = false;
    registerSuccess = false;
    resetPasswordSuccess = false;
  }

  String email;
  String password;
  bool loginSuccess;
  bool registerSuccess;
  bool resetPasswordSuccess;
}