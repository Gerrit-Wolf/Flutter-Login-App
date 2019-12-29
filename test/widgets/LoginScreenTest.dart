import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/components/inputField/InputField.dart';
import 'package:test_app/screens/login/components/ForgotPasswordButton.dart';
import 'package:test_app/screens/login/components/LoginButton.dart';
import 'package:test_app/screens/login/index.dart';
import 'shared/makeTestableWidget.dart';

void main() {
  testWidgets('Login Screen has a Login Button', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginScreen()));
    await tester.pumpAndSettle();

    final Finder buttonTextFinder = find.text('LOGIN');
    final Finder buttonFinder = find.byType(LoginButton);

    expect(buttonTextFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('Login Screen has a Forget Password Button', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginScreen()));
    await tester.pumpAndSettle();

    final Finder buttonTextFinder = find.text('FORGOT_PASSWORD');
    final Finder buttonFinder = find.byType(ForgotPasswordButton);

    expect(buttonTextFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('Login Screen has two input fields for email and password', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginScreen()));
    await tester.pumpAndSettle();

    final Finder passwordFieldTextFinder = find.text('PASSWORD');
    final Finder emailFieldTextFinder = find.text('EMAIL');
    final Finder inputFieldFinder = find.byType(InputField);

    expect(passwordFieldTextFinder, findsOneWidget);
    expect(emailFieldTextFinder, findsOneWidget);
    expect(inputFieldFinder, findsNWidgets(2));
  });

  testWidgets('Login Screen has a title', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginScreen()));
    await tester.pumpAndSettle();

    final Finder titleFinder = find.text('LOGIN_TITLE');

    expect(titleFinder, findsOneWidget);
  });
}