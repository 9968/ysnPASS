import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/state/password_entry.dart';

import '../_test_utils/utils.dart';

// TODO tests for clipboard
void main() {
  final MockNavigatorObserver navigator = MockNavigatorObserver();
  final MockAppState appState = MockAppState();

  setUpAll(() {
    when(appState.passwords).thenReturn(
      UnmodifiableListView(
        [PasswordEntry('entryname', 'username', 'password')],
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
        mockAppState: appState,
        testScreen: ViewDatabase(),
      ),
    );

    await tester.tap(find.text('entryname'));

    verify(navigator.didPush(any, any));
  });
  testWidgets('should navigate on click of add password entry button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockAppState: appState,
        testScreen: ViewDatabase(),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));

    verify(navigator.didPush(any, any));
  });
}
