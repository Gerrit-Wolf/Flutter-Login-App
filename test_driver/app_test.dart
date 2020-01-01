import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:test_app/models/LoginUserData.dart';

void main() {
  group('|| Flutter Test App ||', () {
    final SerializableFinder registerButtonFinder = find.text('REGISTER');
    final SerializableFinder loginButtonFinder = find.text('LOGIN');
    final SerializableFinder resetButtonFinder = find.text('RESET_PASSWORD');
    final SerializableFinder emailFieldFinder = find.text('EMAIL');
    final SerializableFinder passwordFieldFinder = find.text('PASSWORD');
    final SerializableFinder authErrorFinder = find.text('AUTH_ERROR');
    final SerializableFinder forgotPasswordButtonFinder = find.text('FORGOT_PASSWORD');
    final SerializableFinder backToHomeButtonFinder = find.text('BACK_TO_HOME');

    final LoginUserData userData = LoginUserData(
      email: 'machiavelli@outlook.de',
      password: '123456'
    );

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('<< Home Screen >> Login Button redirects to login screen', () async {
      await driver.tap(loginButtonFinder);

      const String searchTitle = 'LOGIN_TITLE';
      final SerializableFinder registerScreenFinder = find.text(searchTitle);

      expect(await driver.getText(registerScreenFinder), searchTitle);
    });

    test('<< Login Screen >> Login Screen has a forgot password button', () async {
      expect(await driver.getText(forgotPasswordButtonFinder), 'FORGOT_PASSWORD');

      await driver.tap(forgotPasswordButtonFinder);
    });

    test('<< ResetPassword Screen >> Reset Password Screen has a title', () async {
      const String searchTitle = 'RESET_PASSWORD_TITLE';
      final SerializableFinder resetScreenFinder = find.text(searchTitle);

      expect(await driver.getText(resetScreenFinder), searchTitle);
    });

    test('<< ResetPassword Screen >> Reset produces error message with invalid user data', () async {
      await driver.tap(resetButtonFinder);

      expect(await driver.getText(authErrorFinder), 'AUTH_ERROR');
    });

    test('<< ResetPassword Screen >> Reset produces error message with malformed email adress', () async {
      await driver.tap(emailFieldFinder);
      await driver.enterText(userData.password);
      await driver.tap(resetButtonFinder);

      expect(await driver.getText(authErrorFinder), 'AUTH_ERROR');

      await driver.tap(emailFieldFinder);
      await driver.enterText('');
    });

    test('<< ResetPassword Screen >> Reset works with valid email adress', () async {
      await driver.tap(emailFieldFinder);
      await driver.enterText(userData.email);
      await driver.tap(resetButtonFinder);

      const String searchTitle = 'LOGIN_TITLE';
      final SerializableFinder registerScreenFinder = find.text(searchTitle);

      expect(await driver.getText(registerScreenFinder), searchTitle);
    });

    test('<< Login Screen >> Login produces error message with invalid user data', () async {
      await driver.tap(loginButtonFinder);

      expect(await driver.getText(authErrorFinder), 'AUTH_ERROR');
    });

    test('<< Login Screen >> Login produces error message when password field is empty', () async {
      await driver.tap(emailFieldFinder);
      await driver.enterText(userData.email);
      await driver.tap(loginButtonFinder);

      expect(await driver.getText(authErrorFinder), 'AUTH_ERROR');

      await driver.tap(emailFieldFinder);
      await driver.enterText('');
    });

    test('<< Login Screen >> Login produces error message when email field is empty', () async {
      await driver.tap(passwordFieldFinder);
      await driver.enterText(userData.password);
      await driver.tap(loginButtonFinder);

      expect(await driver.getText(authErrorFinder), 'AUTH_ERROR');

      await driver.tap(passwordFieldFinder);
      await driver.enterText('');
    });

    test('<< Login Screen >> Login works with valid user data', () async {
      await driver.tap(emailFieldFinder);
      await driver.enterText(userData.email);
      await driver.tap(passwordFieldFinder);
      await driver.enterText(userData.password);
      await driver.tap(loginButtonFinder);
      await driver.tap(backToHomeButtonFinder);

      expect(await driver.getText(registerButtonFinder), 'REGISTER');
      expect(await driver.getText(loginButtonFinder), 'LOGIN');
    });

    test('<< Home Screen >> Register Button redirects to the register screen', () async {
      await driver.tap(registerButtonFinder);

      const String searchTitle = 'REGISTER_TITLE';
      final SerializableFinder registerScreenFinder = find.text(searchTitle);

      expect(await driver.getText(registerScreenFinder), searchTitle);
    });

    test('<< Register Screen >> Register produces error message with invalid user data', () async {
      await driver.tap(registerButtonFinder);

      expect(await driver.getText(authErrorFinder), 'AUTH_ERROR');
    });

    test('<< Register Screen >> Register produces error message when password field is empty', () async {
      await driver.tap(emailFieldFinder);
      await driver.enterText(userData.email);
      await driver.tap(registerButtonFinder);

      expect(await driver.getText(authErrorFinder), 'AUTH_ERROR');

      await driver.tap(emailFieldFinder);
      await driver.enterText('');
    });

    test('<< Register Screen >> Register produces error message when email field is empty', () async {
      await driver.tap(passwordFieldFinder);
      await driver.enterText(userData.password);
      await driver.tap(registerButtonFinder);

      expect(await driver.getText(authErrorFinder), 'AUTH_ERROR');

      await driver.tap(passwordFieldFinder);
      await driver.enterText('');
    });
  });
}