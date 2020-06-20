import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

List<Middleware<AppState>> createDatabaseMiddleware() {
  return [
    TypedMiddleware<AppState, LoadDatabaseNamesAction>(_loadDatabaseNames),
    TypedMiddleware<AppState, LoadDatabaseAction>(_loadDatabase),
    TypedMiddleware<AppState, SaveDatabaseAction>(_saveDatabase),
    TypedMiddleware<AppState, SavePasswordAction>(_saveDatabase),
    TypedMiddleware<AppState, RemovePasswordAction>(_saveDatabase),
  ];
}

void _loadDatabaseNames(
    Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  final directory = await getApplicationDocumentsDirectory();
  store.dispatch(
    DatabaseNamesLoadedAction(
      directory
          .listSync()
          .where(
            (file) => file.path.endsWith('.ysndb'),
          )
          .map((file) => file.path.substring(
              file.path.lastIndexOf('/') + 1, file.path.lastIndexOf('.')))
          .toList(),
    ),
  );
}

void _loadDatabase(Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  final directory = await getApplicationDocumentsDirectory();
  final databasePath = '${directory.path}/${action.databaseName}.ysndb';
  final database = Database.fromJson(
    jsonDecode(
      File(databasePath).readAsStringSync(),
    ),
  );
  store.dispatch(DatabaseLoadedAction(database));
}

void _saveDatabase(Store<AppState> store, action, NextDispatcher next) async {
  next(action);
  final openDatabase = openedDatabaseSelector(store.state);

  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/${openDatabase.name}.ysndb';
  File(filePath).writeAsStringSync(jsonEncode(openDatabase));
}
