import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/components/buttons/PrimaryButton.dart';
import 'package:test_app/components/inputField/InputField.dart';
import 'package:test_app/screens/resetPassword/index.dart';
import 'shared/makeTestableWidget.dart';

void main() {
  testWidgets('Reset Password Screen has a Login Button', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: ResetPasswordScreen()));
    await tester.pumpAndSettle();

    final Finder buttonTextFinder = find.text('RESET_PASSWORD');
    final Finder buttonFinder = find.byType(PrimaryButton);

    expect(buttonTextFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('Reset Password Screen has one input field for email', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: ResetPasswordScreen()));
    await tester.pumpAndSettle();

    final Finder emailFieldTextFinder = find.text('EMAIL');
    final Finder inputFieldFinder = find.byType(InputField);

    expect(emailFieldTextFinder, findsOneWidget);
    expect(inputFieldFinder, findsOneWidget);
  });

  testWidgets('Reset Password Screen has a title', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: ResetPasswordScreen()));
    await tester.pumpAndSettle();

    final Finder titleFinder = find.text('RESET_PASSWORD_TITLE');

    expect(titleFinder, findsOneWidget);
  });
}