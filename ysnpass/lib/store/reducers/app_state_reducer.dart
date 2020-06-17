import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/reducers/databases_reducer.dart';
import 'package:ysnpass/store/reducers/opened_database_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    openedDatabase: openedDatabaseReducer(state.openedDatabase, action),
    databases: databasesReducer(state.databases, action),
  );
}
