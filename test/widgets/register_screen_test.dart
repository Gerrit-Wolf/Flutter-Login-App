import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/components/buttons/PrimaryButton.dart';
import 'package:test_app/components/inputField/InputField.dart';
import 'package:test_app/screens/register/index.dart';
import 'shared/makeTestableWidget.dart';

void main() {
  testWidgets('Register Screen has a Register Button', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: RegisterScreen()));
    await tester.pumpAndSettle();

    final Finder buttonTextFinder = find.text('REGISTER');
    final Finder buttonFinder = find.byType(PrimaryButton);

    expect(buttonTextFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('Register Screen has two input fields for email and password', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: RegisterScreen()));
    await tester.pumpAndSettle();

    final Finder passwordFieldTextFinder = find.text('PASSWORD');
    final Finder emailFieldTextFinder = find.text('EMAIL');
    final Finder inputFieldFinder = find.byType(InputField);

    expect(passwordFieldTextFinder, findsOneWidget);
    expect(emailFieldTextFinder, findsOneWidget);
    expect(inputFieldFinder, findsNWidgets(2));
  });

  testWidgets('Register Screen has a title', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: RegisterScreen()));
    await tester.pumpAndSettle();

    final Finder titleFinder = find.text('REGISTER_TITLE');

    expect(titleFinder, findsOneWidget);
  });
}