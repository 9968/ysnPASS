import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';

final databaseNamesReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, DatabaseNamesLoadedAction>(_loadDatabaseNames),
]);

List<String> _loadDatabaseNames(
    List<String> databaseNames, DatabaseNamesLoadedAction action) {
  return action.databaseNames;
}
