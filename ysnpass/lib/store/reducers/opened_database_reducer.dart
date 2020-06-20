import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';

final openedDatabasePathReducer = combineReducers<String>([
  TypedReducer<String, DatabaseLoadedAction>(_openDatabase),
]);

String _openDatabase(String databasePath, DatabaseLoadedAction action) {
  return action.database.name;
}
