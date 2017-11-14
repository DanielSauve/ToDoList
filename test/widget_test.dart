// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';
import '../lib/components/to_do_list_item.dart';
import '../lib/model/to_do.dart';

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
    expect(find.text('Test ToDoList'), findsOneWidget);
    expect(find.byType(ToDoListItem), findsOneWidget);
  });

  test("Test ToDoSerializer", () async {
    ToDo toDo = new ToDo()
      ..name = "Test ToDoSerializer"
      ..completed = true
      ..created = new DateTime(2016)
      ..updated = new DateTime(2017);
    assert(new ToDoSerializer().toJson(toDo) ==
        '{"completed": true, "name": "Test ToDoSerializer", "created": 1451624400000, "updated": 1483246800000}');

    toDo = new ToDoSerializer().fromJSON('{'
        '"completed": true,'
        ' "name": "Test ToDoSerializer",'
        ' "created": 1451624400000,'
        ' "updated": 1483246800000'
        '}');
    assert(toDo.name == "Test ToDoSerializer");
    assert(toDo.completed == true);
    assert(toDo.created == new DateTime(2016));
    assert(toDo.updated == new DateTime(2017));
  });

  test("Test", () async{
    List<ToDo> items = [new ToDo()
      ..name = "Test ToDoSerializer"
      ..completed = true
      ..created = new DateTime(2016)
      ..updated = new DateTime(2017), new ToDo()
      ..name = "Test List"
      ..completed = false
      ..created = new DateTime(2016)
      ..updated = new DateTime(2017)];
    String encoded = JSON.encode(items);
    List<ToDo> decodedItems = [];
    for (var i in JSON.decode(encoded)) {
      decodedItems.add(new ToDoSerializer().fromJSON(i));
    }
  });
}
