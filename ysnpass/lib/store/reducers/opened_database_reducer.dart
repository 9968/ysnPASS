import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';

final openedDatabaseReducer = combineReducers<String>([
  TypedReducer<String, OpenDatabaseAction>(_openDatabase),
]);

String _openDatabase(String databaseId, OpenDatabaseAction action) {
  return action.databaseId;
}

