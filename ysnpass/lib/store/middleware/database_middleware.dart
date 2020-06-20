import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:ysnpass/filesystem/database_filesystem.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

List<Middleware<AppState>> createDatabaseMiddleware(
    DatabaseFileSystem databaseFileSystem) {
  final loadDatabaseNames = _createLoadDatabaseNames(databaseFileSystem);
  final loadDatabase = _createLoadDatabase(databaseFileSystem);
  final saveDatabase = _createSaveDatabase(databaseFileSystem);
  return [
    TypedMiddleware<AppState, LoadDatabaseNamesAction>(loadDatabaseNames),
    TypedMiddleware<AppState, LoadDatabaseAction>(loadDatabase),
    TypedMiddleware<AppState, SaveDatabaseAction>(saveDatabase),
    TypedMiddleware<AppState, SavePasswordAction>(saveDatabase),
    TypedMiddleware<AppState, RemovePasswordAction>(saveDatabase),
  ];
}

Middleware<AppState> _createLoadDatabaseNames(
    DatabaseFileSystem databaseFileSystem) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    store.dispatch(
      DatabaseNamesLoadedAction(
        await databaseFileSystem.getDatabaseNames(),
      ),
    );
  };
}

Middleware<AppState> _createLoadDatabase(
    DatabaseFileSystem databaseFileSystem) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    store.dispatch(
      DatabaseLoadedAction(
        await databaseFileSystem.openDatabase(action.databaseName),
      ),
    );
  };
}

Middleware<AppState> _createSaveDatabase(
    DatabaseFileSystem databaseFileSystem) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    final openDatabase = openedDatabaseSelector(store.state);

    databaseFileSystem.saveDatabase(openDatabase);
  };
}
