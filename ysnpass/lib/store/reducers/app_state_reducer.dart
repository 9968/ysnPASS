import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/reducers/database_locked_reducer.dart';
import 'package:ysnpass/store/reducers/database_names_reducer.dart';
import 'package:ysnpass/store/reducers/database_reducer.dart';
import 'package:ysnpass/store/reducers/master_password_reducer.dart';
import 'package:ysnpass/store/reducers/opened_database_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    openedDatabaseName:
        openedDatabasePathReducer(state.openedDatabaseName, action),
    databaseNames: databaseNamesReducer(state.databaseNames, action),
    loadedDatabase: databaseReducer(state.loadedDatabase, action),
    masterPassword: masterPasswordReducer(state.masterPassword, action),
    databaseLocked: databaseLockedReducer(state.databaseLocked, action),
  );
}
