import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/view_password/index.dart';
import 'package:ysnpass/state/password_entry.dart';

import '../_test_utils/utils.dart';

void main() {
  final MockNavigatorObserver navigator = MockNavigatorObserver();
  final MockAppState appState = MockAppState();

  setUpAll(() {
    when(appState.passwords).thenReturn(
      UnmodifiableListView(
        [
          PasswordEntry('entryname', 'username', 'password', id: '1234'),
        ],
      ),
    );
  });

  setUp(() {
    reset(navigator);
  });

  testWidgets('appbar title should be name of entry',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockAppState: appState,
        testScreen: ViewPasswordContainer('1234'),
      ),
    );

    expect(find.widgetWithText(AppBar, 'entryname'), findsOneWidget);
  });
  testWidgets('should show username and hidden password',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockAppState: appState,
        testScreen: ViewPasswordContainer('1234'),
      ),
    );

    expect(find.text('username'), findsOneWidget);
    expect(find.text(String.fromCharCode(0x25cf) * 10), findsOneWidget);
  });

  testWidgets('should toggle show/hide password', (WidgetTester tester) async {
    await tester.pumpWidget(testApp(
        mockNavigatorObserver: navigator,
        mockAppState: appState,
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
        mockAppState: appState,
        testScreen: ViewPasswordContainer('1234'),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));

    verify(navigator.didPush(any, any));
  });
}
