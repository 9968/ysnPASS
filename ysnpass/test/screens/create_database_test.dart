import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/create_database/index.dart';

import '../_test_utils/utils.dart';

void main() {
  final MockNavigatorObserver navigator = MockNavigatorObserver();
  final MockAppState appState = MockAppState();

  setUpAll(() {
    when(appState.databases).thenReturn(
      List.of(['name1', 'name2']),
    );
  });

  testWidgets(
      'should show form and dispatch CreateDatabaseAction with filled values',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockAppState: appState,
        testScreen: CreateDatabase(),
      ),
    );

    final nameField = find.byKey(Key('database-name'));
    await tester.showKeyboard(nameField);
    await tester.enterText(nameField, 'databasename');

    final passwordField = find.byKey(Key('master-password'));
    await tester.showKeyboard(passwordField);
    await tester.enterText(passwordField, 'masterpassword');

    await tester.tap(find.byType(RaisedButton));

    verify(
      appState.addDatabase(
          argThat(predicate((db) => db.name == 'databasename')),
          'masterpassword'),
    );
  });
}
