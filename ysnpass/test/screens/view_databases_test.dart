import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/view_databases/index.dart';

import '../_test_utils/utils.dart';

// this doesn't test navigate to database if unlock is successful
// or don't navigate if unlock not successful
void main() {
  final MockNavigatorObserver navigator = MockNavigatorObserver();
  MockAppState appState;

  setUpAll(() {
    appState = new MockAppState();
    when(appState.databases).thenReturn(List.of(['name1', 'name2']));
    when(appState.unlockFailed).thenReturn(false);
    when(appState.unlockDatabase(any, any))
        .thenAnswer((_) => Future.value(true));
  });
  testWidgets('should show list of databases', (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockAppState: appState,
        testScreen: ViewDatabases(),
      ),
    );
    final listTiles = find.byType(ListTile);
    final firstTile = find.text('name1');
    final secondTile = find.text('name2');

    expect(listTiles, findsNWidgets(2));
    expect(firstTile, findsOneWidget);
    expect(secondTile, findsOneWidget);
  });

  testWidgets(
      'should show password dialog and navigate to database if unlock successful',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockNavigatorObserver: navigator,
        mockAppState: appState,
        testScreen: ViewDatabases(),
      ),
    );

    await tester.tap(find.byType(ListTile).at(0));
    await tester.pump();
    final passwordField = find.byType(TextFormField);
    await tester.showKeyboard(passwordField);
    await tester.enterText(passwordField, 'password');
    await tester.tap(find.byKey(Key('unlock-button')));

    verify(navigator.didPush(any, any));
    verify(
      appState.unlockDatabase('name1', 'password'),
    );
  });
  testWidgets('should show password dialog and not try unlock when cancelled',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockAppState: appState,
        mockNavigatorObserver: navigator,
        testScreen: ViewDatabases(),
      ),
    );

    await tester.tap(find.byType(ListTile).at(0));
    await tester.pump();
    final passwordField = find.byType(TextFormField);
    await tester.showKeyboard(passwordField);
    await tester.enterText(passwordField, 'password');
    await tester.tap(find.byKey(Key('cancel-button')));

    verify(navigator.didPush(any, any));
    verifyNever(appState.unlockDatabase(any, any));
  });

  testWidgets(
      'should navigate to create database form when create button is clicked',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockAppState: appState,
        mockNavigatorObserver: navigator,
        testScreen: ViewDatabases(),
      ),
    );
    reset(navigator);
    final button = find.text('CREATE DATABASE');
    await tester.tap(button);

    verify(navigator.didPush(any, any));
  });

  testWidgets('should delete database when delete icon is clicked',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockAppState: appState,
        mockNavigatorObserver: navigator,
        testScreen: ViewDatabases(),
      ),
    );

    final button = find.byType(IconButton).at(0);
    await tester.tap(button);

    verify(appState.removeDatabase('name1'));
  });
}
