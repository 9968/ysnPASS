import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/create_password/index.dart';
import 'package:ysnpass/state/password_entry.dart';

import '../_test_utils/utils.dart';

void main() {
  final MockNavigatorObserver navigator = MockNavigatorObserver();
  final MockAppState appState = MockAppState();

  testWidgets(
      'should show form, save password with filled values and go back to previous screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockAppState: appState,
        testScreen: CreatePassword(),
      ),
    );
    expect(find.text('user1234'), findsNothing);
    expect(find.text('pass1234'), findsNothing);

    final entryname = find.byKey(Key('name'));
    await tester.showKeyboard(entryname);
    await tester.enterText(entryname, 'entryname');

    final username = find.byKey(Key('username'));
    await tester.showKeyboard(username);
    await tester.enterText(username, 'user1234');

    final password = find.byKey(Key('password'));
    await tester.showKeyboard(password);
    await tester.enterText(password, 'pass1234');

    await tester.tap(find.byType(RaisedButton));

    verify(
      appState.savePassword(
        argThat(
          predicate<PasswordEntry>(
            (entry) =>
                entry.name == 'entryname' &&
                entry.username == 'user1234' &&
                entry.password == 'pass1234',
          ),
        ),
      ),
    );
    verify(navigator.didPop(any, any));
  });
}
