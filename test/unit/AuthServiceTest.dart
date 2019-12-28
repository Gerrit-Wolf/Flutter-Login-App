import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AuthService.dart';
import '../mocks/FirebaseAuthMock.dart';
import '../mocks/FirebaseUserMock.dart';

void main() {
  final LoginUserData testValidUserData = LoginUserData(
    email: 'test@test.de',
    password: '123456',
  );

  final LoginUserData testEmptyValidUserData = LoginUserData(
    email: '',
    password: '',
  );

  final LoginUserData testNullValidUserData = LoginUserData(
    email: null,
    password: null,
  );

  final LoginUserData testNonValidUserData = LoginUserData(
    email: 'test-non-valid@test-email.de',
    password: 'test-non-valid-password',
  );

  final FirebaseUserMock firebaseUserMock = FirebaseUserMock();
  final FirebaseAuthMock firebaseAuthMock = FirebaseAuthMock();
  final AuthService authService = AuthService(firebaseAuth: firebaseAuthMock);

  group('Login', () {
    test('Login should work with valid user data', () async {
      when(
        firebaseAuthMock.signInWithEmailAndPassword(
          email: testValidUserData.email,
          password: testValidUserData.password,
        )
      ).thenAnswer(
        (_) => Future<FirebaseUserMock>.value(firebaseUserMock)
      );

      final bool actionSuccess = await authService.login(testValidUserData);

      verify(
        firebaseAuthMock.signInWithEmailAndPassword(
          email: testValidUserData.email,
          password: testValidUserData.password,
        )
      ).called(1);

      expect(actionSuccess, true);
    });

    test('Login should not work with invalid user data', () async {
      when(
        firebaseAuthMock.signInWithEmailAndPassword(
          email: testNonValidUserData.email,
          password: testNonValidUserData.password,
        )
      ).thenAnswer(
        (_) => Future<FirebaseUserMock>.value(null)
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
      final bool actionSuccess = await authService.login(testNullValidUserData);

      verifyNever(
        firebaseAuthMock.signInWithEmailAndPassword(
          email: testNullValidUserData.email,
          password: testNullValidUserData.password,
        )
      ).called(0);

      expect(actionSuccess, false);
    });

    test('Login should not work with empty user data', () async {
      final bool actionSuccess = await authService.login(testEmptyValidUserData);

      verifyNever(
        firebaseAuthMock.signInWithEmailAndPassword(
          email: testEmptyValidUserData.email,
          password: testEmptyValidUserData.password,
        )
      ).called(0);

      expect(actionSuccess, false);
    });
  });

  group('Register', () {
    test('Register should work with valid user data', () async {
      when(
        firebaseAuthMock.createUserWithEmailAndPassword(
          email: testValidUserData.email,
          password: testValidUserData.password,
        )
      ).thenAnswer(
        (_) => Future<FirebaseUserMock>.value(firebaseUserMock)
      );

      final bool actionSuccess = await authService.register(testValidUserData);

      verify(
        firebaseAuthMock.createUserWithEmailAndPassword(
          email: testValidUserData.email,
          password: testValidUserData.password,
        )
      ).called(1);

      expect(actionSuccess, true);
    });

    test('Register should not work with invalid user data', () async {
      when(
        firebaseAuthMock.createUserWithEmailAndPassword(
          email: testNonValidUserData.email,
          password: testNonValidUserData.password,
        )
      ).thenAnswer(
        (_) => Future<FirebaseUserMock>.value(null)
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
      final bool actionSuccess = await authService.register(testNullValidUserData);

      verifyNever(
        firebaseAuthMock.createUserWithEmailAndPassword(
          email: testNullValidUserData.email,
          password: testNullValidUserData.password,
        )
      ).called(0);

      expect(actionSuccess, false);
    });

    test('Register should not work with empty user data', () async {
      final bool actionSuccess = await authService.register(testEmptyValidUserData);

      verifyNever(
        firebaseAuthMock.createUserWithEmailAndPassword(
          email: testEmptyValidUserData.email,
          password: testEmptyValidUserData.password,
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
      final bool actionSuccess = await authService.resetPassword(testNullValidUserData);

      verifyNever(
        firebaseAuthMock.sendPasswordResetEmail(
          email: testNullValidUserData.email,
        )
      ).called(0);

      expect(actionSuccess, false);
    });

    test('Reset Password should not work with empty user data', () async {
      final bool actionSuccess = await authService.resetPassword(testEmptyValidUserData);

      verifyNever(
        firebaseAuthMock.sendPasswordResetEmail(
          email: testEmptyValidUserData.email,
        )
      ).called(0);

      expect(actionSuccess, false);
    });
  });
}