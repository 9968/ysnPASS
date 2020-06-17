import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/database.dart';

final databasesReducer = combineReducers<List<Database>>([
  TypedReducer<List<Database>, AddDatabaseAction>(_addDatabase),
]);

List<Database> _addDatabase(
    List<Database> databases, AddDatabaseAction action) {
  return List.from(databases)..add(action.database);
}
