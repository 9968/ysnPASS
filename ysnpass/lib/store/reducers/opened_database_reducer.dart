import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';

final openedDatabasePathReducer = combineReducers<String>([
  TypedReducer<String, DatabaseLoadedAction>(_openDatabase),
  TypedReducer<String, LockDatabaseAction>(_lockDatabase),
]);

String _openDatabase(String databasePath, DatabaseLoadedAction action) {
  return action.database.name;
}

String _lockDatabase(String databasePath, LockDatabaseAction action) {
  return '';
}
