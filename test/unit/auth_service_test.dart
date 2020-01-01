import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AuthService.dart';
import '../mocks/AuthResultMock.dart';
import '../mocks/FirebaseAuthMock.dart';

void main() {
  final LoginUserData testValidUserData = LoginUserData(
    email: 'test@test.de',
    password: '123456',
  );

  final LoginUserData testEmptyUserData = LoginUserData(
    email: '',
    password: '',
  );

  final LoginUserData testNullUserData = LoginUserData(
    email: null,
    password: null,
  );

  final LoginUserData testNonValidUserData = LoginUserData(
    email: 'test-non-valid@test-email.de',
    password: 'test-non-valid-password',
  );

  final AuthResultMock firebaseAuthResultMock = AuthResultMock();
  final FirebaseAuthMock firebaseAuthMock = FirebaseAuthMock();
  final AuthService authService = AuthService(firebaseAuth: firebaseAuthMock);

  group('Login', () {
    test('Login should work with valid user data', () async {
      await authService.login(testValidUserData);

      verify(
        firebaseAuthMock.signInWithEmailAndPassword(
          email: testValidUserData.email,
          password: testValidUserData.password,
        )
      ).called(1);
    });

    test('Login should not work with invalid user data', () async {
      when(
        firebaseAuthMock.signInWithEmailAndPassword(
          email: testNonValidUserData.email,
          password: testNonValidUserData.password,
        )
      ).thenAnswer(
        (_) => Future<AuthResultMock>.value(firebaseAuthResultMock)
      );

      final bool actionSuccess = await authService.login(testNonValidUserData);

      verify(
        firebaseAuthMock.signInWithEmailAndPassword(
          email: testNonValidUserData.email,
          password: testNonValidUserData.password,
        )
      ).called(1);

      expect(actionSuccess, false);
    });

    test('Login should not work with null user data', () async {
      final bool actionSuccess = await authService.login(testNullUserData);

      verifyNever(
        firebaseAuthMock.signInWithEmailAndPassword(
          email: testNullUserData.email,
          password: testNullUserData.password,
        )
      ).called(0);

      expect(actionSuccess, false);
    });

    test('Login should not work with empty user data', () async {
      final bool actionSuccess = await authService.login(testEmptyUserData);

      verifyNever(
        firebaseAuthMock.signInWithEmailAndPassword(
          email: testEmptyUserData.email,
          password: testEmptyUserData.password,
        )
      ).called(0);

      expect(actionSuccess, false);
    });
  });

  group('Register', () {
    test('Register should work with valid user data', () async {
      await authService.register(testValidUserData);

      verify(
        firebaseAuthMock.createUserWithEmailAndPassword(
          email: testValidUserData.email,
          password: testValidUserData.password,
        )
      ).called(1);
    });

    test('Register should not work with invalid user data', () async {
      when(
        firebaseAuthMock.createUserWithEmailAndPassword(
          email: testNonValidUserData.email,
          password: testNonValidUserData.password,
        )
      ).thenAnswer(
        (_) => Future<AuthResultMock>.value(firebaseAuthResultMock)
      );

      final bool actionSuccess = await authService.register(testNonValidUserData);

      verify(
        firebaseAuthMock.createUserWithEmailAndPassword(
          email: testNonValidUserData.email,
          password: testNonValidUserData.password,
        )
      ).called(1);

      expect(actionSuccess, false);
    });

    test('Register should not work with null user data', () async {
      final bool actionSuccess = await authService.register(testNullUserData);

      verifyNever(
        firebaseAuthMock.createUserWithEmailAndPassword(
          email: testNullUserData.email,
          password: testNullUserData.password,
        )
      ).called(0);

      expect(actionSuccess, false);
    });

    test('Register should not work with empty user data', () async {
      final bool actionSuccess = await authService.register(testEmptyUserData);

      verifyNever(
        firebaseAuthMock.createUserWithEmailAndPassword(
          email: testEmptyUserData.email,
          password: testEmptyUserData.password,
        )
      ).called(0);

      expect(actionSuccess, false);
    });
  });

  group('Reset Password', () {
    test('Reset Password should work with valid user data', () async {
      final bool actionSuccess = await authService.resetPassword(testValidUserData);

      verify(
        firebaseAuthMock.sendPasswordResetEmail(
          email: testValidUserData.email,
        )
      ).called(1);

      expect(actionSuccess, true);
    });

    test('Reset Password should not work with invalid user data', () async {
      when(
        firebaseAuthMock.sendPasswordResetEmail(
          email: testNonValidUserData.email,
        )
      ).thenThrow(Exception());

      final bool actionSuccess = await authService.resetPassword(testNonValidUserData);

      verify(
        firebaseAuthMock.sendPasswordResetEmail(
          email: testNonValidUserData.email,
        )
      ).called(1);

      expect(actionSuccess, false);
    });

    test('Reset Password should not work with null user data', () async {
      final bool actionSuccess = await authService.resetPassword(testNullUserData);

      verifyNever(
        firebaseAuthMock.sendPasswordResetEmail(
          email: testNullUserData.email,
        )
      ).called(0);

      expect(actionSuccess, false);
    });

    test('Reset Password should not work with empty user data', () async {
      final bool actionSuccess = await authService.resetPassword(testEmptyUserData);

      verifyNever(
        firebaseAuthMock.sendPasswordResetEmail(
          email: testEmptyUserData.email,
        )
      ).called(0);

      expect(actionSuccess, false);
    });
  });
}