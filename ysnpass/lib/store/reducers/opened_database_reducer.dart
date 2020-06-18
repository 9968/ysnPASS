import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

final openedDatabaseReducer = combineReducers<Database>([
  TypedReducer<Database, OpenDatabaseAction>(_openDatabase),
  TypedReducer<Database, SavePasswordAction>(_savePassword),
  TypedReducer<Database, RemovePasswordAction>(_removePassword),
]);

Database _openDatabase(Database database, OpenDatabaseAction action) {
  return action.database;
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

  return Database(name: database.name, passwordEntries: passwordList);
}

Database _removePassword(Database database, RemovePasswordAction action) {
  return Database(
      name: database.name,
      passwordEntries: List.from(database.passwordEntries)
        ..removeWhere((PasswordEntry password) => password.id == action.id));
}
