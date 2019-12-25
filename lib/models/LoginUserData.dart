class LoginUserData {
  LoginUserData(
    this.email,
    this.password,
    this.actionSuccess,
  );

  LoginUserData.empty() {
    email = null;
    password = null;
    actionSuccess = false;
  }

  String email;
  String password;
  bool actionSuccess;
}