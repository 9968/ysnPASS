import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';

final databaseNamesReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, DatabaseNamesLoadedAction>(_loadPaths),
]);

List<String> _loadPaths(
    List<String> databaseNames, DatabaseNamesLoadedAction action) {
  return action.databaseNames;
}
