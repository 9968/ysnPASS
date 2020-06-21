import 'package:redux/redux.dart';
import 'package:ysnpass/filesystem/database_filesystem.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

List<Middleware<AppState>> createDatabaseMiddleware(
    DatabaseFileSystem databaseFileSystem) {
  final loadDatabaseNames = _createLoadDatabaseNames(databaseFileSystem);
  final loadDatabase = _createLoadDatabase(databaseFileSystem);
  final saveDatabase = _createSaveDatabase(databaseFileSystem);
  final removeDatabase = _createRemoveDatabase(databaseFileSystem);
  return [
    TypedMiddleware<AppState, LoadDatabaseNamesAction>(loadDatabaseNames),
    TypedMiddleware<AppState, LoadDatabaseAction>(loadDatabase),
    TypedMiddleware<AppState, RemoveDatabaseAction>(removeDatabase),
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
    // when saving a new database there is none opened yet
    final openDatabase = openedDatabaseSelector(store.state) ?? action.database;

    await databaseFileSystem.saveDatabase(openDatabase);
  };
}

Middleware<AppState> _createRemoveDatabase(
    DatabaseFileSystem databaseFileSystem) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    databaseFileSystem.removeDatabase(action.databaseName);
  };
}
