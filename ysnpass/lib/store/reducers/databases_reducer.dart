import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

final databasesReducer = combineReducers<List<Database>>([
  TypedReducer<List<Database>, SaveDatabaseAction>(_saveDatabase),
  TypedReducer<List<Database>, SavePasswordAction>(_savePassword),
  TypedReducer<List<Database>, RemovePasswordAction>(_removePassword),
]);

List<Database> _savePassword(
    List<Database> databases, SavePasswordAction action) {
  final openDatabase =
      databases.firstWhere((database) => database.id == action.databaseId);
  final List<PasswordEntry> passwordList =
      List.from(openDatabase.passwordEntries);
  final index = passwordList.indexWhere(
      (passwordEntry) => passwordEntry.id == action.passwordEntry.id);

  if (index >= 0) {
    passwordList[index] = action.passwordEntry;
  } else {
    passwordList.add(action.passwordEntry);
  }

  return _saveDatabase(
    databases,
    SaveDatabaseAction(
      openDatabase.copyWith(passwordEntries: passwordList),
    ),
  );
}

List<Database> _removePassword(
    List<Database> databases, RemovePasswordAction action) {
  final openDatabase =
      databases.firstWhere((database) => database.id == action.databaseId);
  return _saveDatabase(
    databases,
    SaveDatabaseAction(
      openDatabase.copyWith(
        passwordEntries: List.from(openDatabase.passwordEntries)
          ..removeWhere((PasswordEntry password) => password.id == action.id),
      ),
    ),
  );
}

List<Database> _saveDatabase(
    List<Database> databases, SaveDatabaseAction action) {
  final List<Database> databaseList = List.from(databases);
  final index =
      databaseList.indexWhere((database) => database.id == action.database.id);

  if (index >= 0) {
    databaseList[index] = action.database;
  } else {
    databaseList.add(action.database);
  }
  return databaseList;
}
