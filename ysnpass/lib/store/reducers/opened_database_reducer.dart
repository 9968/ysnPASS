import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';

final openedDatabasePathReducer = combineReducers<String>([
  TypedReducer<String, LoadDatabaseAction>(_openDatabase),
]);

String _openDatabase(String databasePath, LoadDatabaseAction action) {
  return action.databaseName;
}
