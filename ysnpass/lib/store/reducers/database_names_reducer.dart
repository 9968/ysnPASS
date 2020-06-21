import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';

final databaseNamesReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, DatabaseNamesLoadedAction>(_loadDatabaseNames),
  TypedReducer<List<String>, RemoveDatabaseAction>(_removeDatabase),
]);

List<String> _loadDatabaseNames(
    List<String> databaseNames, DatabaseNamesLoadedAction action) {
  return action.databaseNames;
}

List<String> _removeDatabase(
    List<String> databaseNames, RemoveDatabaseAction action) {
  return List.from(databaseNames)
    ..removeWhere((name) => name == action.databaseName);
}
