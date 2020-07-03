import 'package:redux/redux.dart';
import 'package:ysnpass/filesystem/database_filesystem.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

List<Middleware<AppState>> createDatabaseMiddleware(
    DatabaseFileSystem databaseFileSystem) {
  final loadDatabaseNames = _createLoadDatabaseNames(databaseFileSystem);
  final loadDatabase = _createLoadDatabase(databaseFileSystem);
  final createDatabase = _createCreateDatabase(databaseFileSystem);
  final saveDatabase = _createSaveDatabase(databaseFileSystem);
  final removeDatabase = _createRemoveDatabase(databaseFileSystem);
  return [
    TypedMiddleware<AppState, LoadDatabaseNamesAction>(loadDatabaseNames),
    TypedMiddleware<AppState, CreateDatabaseAction>(createDatabase),
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

Middleware<AppState> _createCreateDatabase(
    DatabaseFileSystem databaseFileSystem) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    await databaseFileSystem.saveDatabase(
        action.database, action.masterPassword);
    store.dispatch(DatabaseCreatedAction(action.database.name));
    store.dispatch(
        LoadDatabaseAction(action.database.name, action.masterPassword));
  };
}

Middleware<AppState> _createLoadDatabase(
    DatabaseFileSystem databaseFileSystem) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    try {
      final database = await databaseFileSystem.openDatabase(
          action.databaseName, action.masterPassword);
      store.dispatch(DatabaseLoadedAction(database, action.masterPassword));
    } catch (e) {
      print('database load failed');
      store.dispatch(LoadDatabaseFailedAction());
    }
  };
}

Middleware<AppState> _createSaveDatabase(
    DatabaseFileSystem databaseFileSystem) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    final openDatabase = openedDatabaseSelector(store.state);
    final masterPassword = masterPasswordSelector(store.state);

    await databaseFileSystem.saveDatabase(openDatabase, masterPassword);
  };
}

Middleware<AppState> _createRemoveDatabase(
    DatabaseFileSystem databaseFileSystem) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    databaseFileSystem.removeDatabase(action.databaseName);
  };
}