import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/state/app_state.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockAppState extends Mock implements AppState {}

Widget testApp({
  @required NavigatorObserver mockNavigatorObserver,
  @required AppState mockAppState,
  @required Widget testScreen,
}) {
  return ChangeNotifierProvider.value(
    value: mockAppState,
    child: MaterialApp(
      home: testScreen,
      navigatorObservers: [mockNavigatorObserver],
    ),
  );
}
