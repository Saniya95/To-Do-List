// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo_app/main.dart';

void main() {
  testWidgets('Adds a task and updates summary', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('No tasks yet'), findsOneWidget);
    expect(find.textContaining('0 tasks'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    expect(find.text('No tasks yet'), findsNothing);
    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.textContaining('1 tasks'), findsOneWidget);
    expect(find.textContaining('0 completed'), findsOneWidget);
  });
}
