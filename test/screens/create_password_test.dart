import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/create_password/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';

import '../_test_utils/utils.dart';

void main() {
  final MockNavigatorObserver navigator = MockNavigatorObserver();

  var store;

  setUpAll(() {
    store = mockStore(AppState());
  });

  testWidgets(
      'should show form, dispatch SavePasswordAction with filled values and go back to previous screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockStore: store,
        testScreen: CreatePassword(),
      ),
    );
    expect(find.text('user1234'), findsNothing);
    expect(find.text('pass1234'), findsNothing);

    final username = find.byKey(Key('username'));
    await tester.showKeyboard(username);
    await tester.enterText(username, 'user1234');

    final password = find.byKey(Key('password'));
    await tester.showKeyboard(password);
    await tester.enterText(password, 'pass1234');

    await tester.tap(find.byType(RaisedButton));

    verify(
      store.dispatch(
        argThat(
          predicate<SavePasswordAction>(
            (action) =>
                action.passwordEntry.username == 'user1234' &&
                action.passwordEntry.password == 'pass1234',
          ),
        ),
      ),
    );
    verify(navigator.didPop(any, any));
  });
}
