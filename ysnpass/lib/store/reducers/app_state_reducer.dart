import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/reducers/databases_reducer.dart';
import 'package:ysnpass/store/reducers/opened_database_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    openedDatabaseId: openedDatabaseReducer(state.openedDatabaseId, action),
    databases: databasesReducer(state.databases, action),
  );
}
