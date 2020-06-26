import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

final databaseReducer = combineReducers<Database>([
  TypedReducer<Database, DatabaseLoadedAction>(_loadDatabase),
  TypedReducer<Database, SavePasswordAction>(_savePassword),
  TypedReducer<Database, RemovePasswordAction>(_removePassword),
  TypedReducer<Database, LockDatabaseAction>(_lockDatabase),
]);

Database _loadDatabase(Database database, DatabaseLoadedAction action) {
  return action.database;
}

Database _lockDatabase(Database database, LockDatabaseAction action) {
  return null;
}

Database _savePassword(Database database, SavePasswordAction action) {
  final List<PasswordEntry> passwordList = List.from(database.passwordEntries);
  final index = passwordList.indexWhere(
      (passwordEntry) => passwordEntry.id == action.passwordEntry.id);

  if (index >= 0) {
    passwordList[index] = action.passwordEntry;
  } else {
    passwordList.add(action.passwordEntry);
  }

  return database.copyWith(passwordEntries: passwordList);
}

Database _removePassword(Database database, RemovePasswordAction action) {
  return database.copyWith(
    passwordEntries: List.from(database.passwordEntries)
      ..removeWhere((PasswordEntry password) => password.id == action.id),
  );
}
