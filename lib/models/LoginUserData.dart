class LoginUserData {
  LoginUserData(
    this.email,
    this.password,
  );

  LoginUserData.empty() {
    email = null;
    password = null;
  }

  String email;
  String password;
}