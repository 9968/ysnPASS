import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

final openedDatabaseReducer = combineReducers<Database>([
  TypedReducer<Database, OpenDatabaseAction>(_openDatabase),
  TypedReducer<Database, AddPasswordAction>(_addPassword),
  TypedReducer<Database, RemovePasswordAction>(_removePassword),
]);

Database _openDatabase(Database database, OpenDatabaseAction action) {
  return action.database;
}

Database _addPassword(Database database, AddPasswordAction action) {
  return Database(
      name: database.name,
      passwordEntries:
          List.from([...database.passwordEntries, action.passwordEntry]));
}

Database _removePassword(Database database, RemovePasswordAction action) {
  return Database(
      name: database.name,
      passwordEntries: List.from(database.passwordEntries)
        ..removeWhere((PasswordEntry password) => password.id == action.id));
}
