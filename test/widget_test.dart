// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';
import '../lib/components/to_do_list_item.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Save'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(FlatButton), findsNWidgets(2));

    await tester.enterText(find.byType(TextField), "Test ToDoList");
    await tester.tap(find.byType(FlatButton).at(1));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Not in List'), findsNothing);
    expect(find.text('Test ToDoList'),findsOneWidget);
    expect(find.byType(ToDoListItem), findsOneWidget);
  });
}
