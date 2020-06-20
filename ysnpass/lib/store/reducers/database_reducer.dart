import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

final databaseReducer = combineReducers<Database>([
  TypedReducer<Database, DatabaseLoadedAction>(_loadDatabase),
  TypedReducer<Database, SavePasswordAction>(_savePassword),
  TypedReducer<Database, RemovePasswordAction>(_removePassword),
]);

Database _loadDatabase(Database database, DatabaseLoadedAction action) {
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

  return database.copyWith(passwordEntries: passwordList);
}

Database _removePassword(Database database, RemovePasswordAction action) {
  return database.copyWith(
    passwordEntries: List.from(database.passwordEntries)
      ..removeWhere((PasswordEntry password) => password.id == action.id),
  );
}

// List<Database> _saveDatabase(
//     List<Database> databases, SaveDatabaseAction action) {
//   final List<Database> databaseList = List.from(databases);
//   final index =
//       databaseList.indexWhere((database) => database.id == action.database.id);

//   if (index >= 0) {
//     databaseList[index] = action.database;
//   } else {
//     databaseList.add(action.database);
//   }
//   return databaseList;
// }
