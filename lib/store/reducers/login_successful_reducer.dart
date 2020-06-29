import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';

final loginSuccessfulReducer = combineReducers<bool>([
  TypedReducer<bool, DatabaseLoadedAction>(_successful),
  TypedReducer<bool, LoadDatabaseFailedAction>(_unsuccessful),
  TypedReducer<bool, LockDatabaseAction>(_reset),
]);

bool _successful(bool loginSuccessful, DatabaseLoadedAction action) {
  return true;
}

bool _unsuccessful(bool loginSuccessful, LoadDatabaseFailedAction action) {
  return false;
}

bool _reset(bool loginSuccessful, LockDatabaseAction action) {
  return null;
}
