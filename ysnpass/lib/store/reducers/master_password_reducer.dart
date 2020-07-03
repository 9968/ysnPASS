import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';

final masterPasswordReducer = combineReducers<String>([
  TypedReducer<String, DatabaseLoadedAction>(_loadMasterPassword),
  TypedReducer<String, LockDatabaseAction>(_lockMasterPassword),
]);

String _loadMasterPassword(String masterPassword, DatabaseLoadedAction action) {
  return action.masterPassword;
}

String _lockMasterPassword(String masterPassword, LockDatabaseAction action) {
  return '';
}
