import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/screens/home/index.dart';
import 'shared/makeTestableWidget.dart';

void main() {
  testWidgets('Home Screen has a title and subtitle', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: HomeScreen()));
    await tester.pumpAndSettle();

    final Finder titleFinder = find.byType(RichText).first;

    expect(titleFinder.evaluate().isEmpty, false);
  });

  testWidgets('Home Screen has a login and a register button', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: HomeScreen()));
    await tester.pumpAndSettle();

    final Finder buttonFinder = find.byType(Text);
    final Finder loginButtonFinder = find.text('LOGIN');
    final Finder registerButtonFinder = find.text('REGISTER');

    expect(buttonFinder, findsNWidgets(2));
    expect(loginButtonFinder, findsOneWidget);
    expect(registerButtonFinder, findsOneWidget);
  });

  testWidgets('Home Screen has an logo icon', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: HomeScreen()));
    await tester.pumpAndSettle();

    final Finder logoFinder = find.byType(Container).first;
    final Element boxDecoration = logoFinder.evaluate().elementAt(0);

    expect(boxDecoration, isNotNull);
    expect(logoFinder, findsOneWidget);
  });
}