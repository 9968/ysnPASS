import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:ysnpass/store/models/app_state.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class _MockStore extends Mock implements Store<AppState> {}

Widget testApp({
  @required Store<AppState> mockStore,
  @required NavigatorObserver mockNavigatorObserver,
  @required Widget testScreen,
}) {
  return StoreProvider(
    store: mockStore,
    child: MaterialApp(
      home: testScreen,
      navigatorObservers: [mockNavigatorObserver],
    ),
  );
}

_MockStore mockStore(AppState state) {
  final _MockStore mockStore = _MockStore();
  when(mockStore.dispatch(any)).thenReturn(null);
  when(mockStore.state).thenReturn(state);
  when(mockStore.onChange).thenAnswer((_) => Stream.empty());

  return mockStore;
}
