import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class LoadDatabaseNamesAction {}

class DatabaseNamesLoadedAction {
  final List<String> databaseNames;
  DatabaseNamesLoadedAction(this.databaseNames);
}

class LoadDatabaseAction {
  final String databaseName;
  LoadDatabaseAction(this.databaseName);
}

class DatabaseLoadedAction {
  final Database database;
  DatabaseLoadedAction(this.database);
}

class SaveDatabaseAction {
  final Database database;
  SaveDatabaseAction(this.database);
}

class RemoveDatabaseAction {
  final String databaseName;
  RemoveDatabaseAction(this.databaseName);
}

class SavePasswordAction {
  final PasswordEntry passwordEntry;
  SavePasswordAction(this.passwordEntry);
}

class RemovePasswordAction {
  final String id;
  RemovePasswordAction(this.id);
}
