import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/view_password/index.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

import '../_test_utils/utils.dart';

void main() {
  final MockNavigatorObserver navigator = MockNavigatorObserver();

  var store;

  setUpAll(() {
    store = mockStore(
      AppState(
        loadedDatabase: Database(
          name: 'database',
          passwordEntries: [PasswordEntry('username', 'password', id: '1234')],
        ),
      ),
    );
  });

  setUp(() {
    reset(navigator);
  });

  testWidgets('should show username and hidden password',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockStore: store,
        testScreen: ViewPasswordContainer('1234'),
      ),
    );

    expect(find.text('username'), findsOneWidget);
    expect(find.text(String.fromCharCode(0x25cf) * 10), findsOneWidget);
  });

  testWidgets('should toggle show/hide password', (WidgetTester tester) async {
    await tester.pumpWidget(testApp(
        mockNavigatorObserver: navigator,
        mockStore: store,
        testScreen: ViewPasswordContainer('1234')));
    final toggleShowPassword = find.byKey(Key('toggle-show-password'));
    await tester.tap(toggleShowPassword);
    await tester.pump();

    expect(find.text('password'), findsOneWidget);

    await tester.tap(toggleShowPassword);
    await tester.pump();

    expect(find.text('password'), findsNothing);
  });

  testWidgets('should navigate on click of edit password entry button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockStore: store,
        testScreen: ViewPasswordContainer('1234'),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));

    verify(navigator.didPush(any, any));
  });
}
