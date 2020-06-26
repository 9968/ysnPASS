import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';

final databaseLockedReducer = combineReducers<bool>([
  TypedReducer<bool, DatabaseLoadedAction>(_unlockDatabase),
  TypedReducer<bool, LoadDatabaseFailedAction>(_lockDatabase),
  TypedReducer<bool, LockDatabaseAction>(_lockDatabase),
]);

bool _unlockDatabase(bool databaseLocked, DatabaseLoadedAction action) {
  return false;
}

bool _lockDatabase(bool databaseLocked, dynamic action) {
  return true;
}
