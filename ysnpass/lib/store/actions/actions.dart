import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class LoadDatabaseNamesAction {}

class DatabaseNamesLoadedAction {
  final List<String> databaseNames;
  DatabaseNamesLoadedAction(this.databaseNames);
}

class CreateDatabaseAction {
  final Database database;

  CreateDatabaseAction(this.database);
}

class DatabaseCreatedAction {
  final String databaseName;
  DatabaseCreatedAction(this.databaseName);
}

class LoadDatabaseAction {
  final String databaseName;
  LoadDatabaseAction(this.databaseName);
}

class DatabaseLoadedAction {
  final Database database;
  DatabaseLoadedAction(this.database);
}

class SaveDatabaseAction {}

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
