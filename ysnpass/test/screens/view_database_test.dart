import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/view_database/index.dart';
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
          passwordEntries: [PasswordEntry('username', 'password')],
        ),
      ),
    );
  });

  setUp(() {
    reset(navigator);
  });

  testWidgets('should show list of password entries and navigate on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockStore: store,
        testScreen: ViewDatabase(),
      ),
    );

    await tester.tap(find.text('username'));

    verify(navigator.didPush(any, any));
  });

  testWidgets('should navigate on click of add password entry button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockStore: store,
        testScreen: ViewDatabase(),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));

    verify(navigator.didPush(any, any));
  });
}
