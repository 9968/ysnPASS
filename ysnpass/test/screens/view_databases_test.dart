import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ysnpass/screens/view_databases/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';

import '../_test_utils/utils.dart';

void main() {
  final MockNavigatorObserver navigator = MockNavigatorObserver();

  var store;

  setUpAll(() {
    store = mockStore(AppState(databaseNames: ['name1', 'name2']));
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

  testWidgets('should navigate and load database when list tile is clicked',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      testApp(
        mockStore: store,
        mockNavigatorObserver: navigator,
        testScreen: ViewDatabases(onInit: () => null),
      ),
    );

    await tester.tap(find.byType(ListTile).at(0));

    verify(navigator.didPush(any, any));
    verify(store.dispatch(argThat(isA<LoadDatabaseAction>())));
  });
}
