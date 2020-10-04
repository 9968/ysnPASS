import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/edit_password/index.dart';
import 'package:ysnpass/state/password_entry.dart';

import '../_test_utils/utils.dart';

void main() {
  final MockNavigatorObserver navigator = MockNavigatorObserver();
  final MockAppState appState = MockAppState();

  testWidgets(
      'should show form, dispatch SavePasswordAction with changed values and go back to previous screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockAppState: appState,
        testScreen: EditPasswordScreen(
          passwordEntry:
              PasswordEntry('entryname', 'user1234', 'pass1234', id: '1234'),
        ),
      ),
    );

    expect(find.text('entryname'), findsOneWidget);
    expect(find.text('user1234'), findsOneWidget);
    expect(find.text('pass1234'), findsOneWidget);

    final password = find.byKey(Key('password'));
    await tester.showKeyboard(password);
    await tester.enterText(password, 'changed');

    await tester.tap(find.byType(RaisedButton));

    verify(
      appState.savePassword(
        argThat(
          predicate<PasswordEntry>(
            (entry) =>
                entry.name == 'entryname' &&
                entry.username == 'user1234' &&
                entry.password == 'changed' &&
                entry.id == '1234',
          ),
        ),
      ),
    );
    verify(navigator.didPop(any, any));
  });
}
