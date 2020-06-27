import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/view_databases/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';

import '../_test_utils/utils.dart';

// this doesn't test navigate to database if unlock is successful
// or don't navigate if unlock not successful
void main() {
  final MockNavigatorObserver navigator = MockNavigatorObserver();

  var store;

  setUpAll(() {
    store = mockStore(
      AppState(
        databaseNames: ['name1', 'name2'],
      ),
    );
  });

  testWidgets('should show list of databases', (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockStore: store,
        mockNavigatorObserver: navigator,
        testScreen: ViewDatabases(onInit: () => null),
      ),
    );
    final listTiles = find.byType(ListTile);
    final firstTile = find.text('name1');
    final secondTile = find.text('name2');

    expect(listTiles, findsNWidgets(2));
    expect(firstTile, findsOneWidget);
    expect(secondTile, findsOneWidget);
  });

  testWidgets('should show password dialog and dispatch load database action',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockStore: store,
        mockNavigatorObserver: navigator,
        testScreen: ViewDatabases(onInit: () => null),
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
      store.dispatch(
        predicate<LoadDatabaseAction>((action) =>
            action.databaseName == 'name1' &&
            action.masterPassword == 'password'),
      ),
    );
  });
  testWidgets(
      'should show password dialog and not dispatch load database action when cancelled',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockStore: store,
        mockNavigatorObserver: navigator,
        testScreen: ViewDatabases(onInit: () => null),
      ),
    );

    await tester.tap(find.byType(ListTile).at(0));
    await tester.pump();
    final passwordField = find.byType(TextFormField);
    await tester.showKeyboard(passwordField);
    await tester.enterText(passwordField, 'password');
    await tester.tap(find.byKey(Key('cancel-button')));

    verify(navigator.didPush(any, any));
    verifyNever(store.dispatch());
  });

  testWidgets(
      'should navigate to create database form when create button is clicked',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockStore: store,
        mockNavigatorObserver: navigator,
        testScreen: ViewDatabases(onInit: () => null),
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
        mockStore: store,
        mockNavigatorObserver: navigator,
        testScreen: ViewDatabases(onInit: () => null),
      ),
    );

    final button = find.byType(IconButton).at(0);
    await tester.tap(button);

    verify(
      store.dispatch(
        argThat(
          predicate<RemoveDatabaseAction>(
              (action) => action.databaseName == 'name1'),
        ),
      ),
    );
  });
}
