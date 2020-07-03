import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class LoadDatabaseNamesAction {}

class DatabaseNamesLoadedAction {
  final List<String> databaseNames;
  DatabaseNamesLoadedAction(this.databaseNames);
}

class CreateDatabaseAction {
  final Database database;
  final String masterPassword;

  CreateDatabaseAction(this.database, this.masterPassword);
}

class DatabaseCreatedAction {
  final String databaseName;
  DatabaseCreatedAction(this.databaseName);
}

class LoadDatabaseAction {
  final String databaseName;
  final String masterPassword;
  LoadDatabaseAction(this.databaseName, this.masterPassword);
}

class DatabaseLoadedAction {
  final Database database;
  final String masterPassword;
  DatabaseLoadedAction(this.database, this.masterPassword);
}

class LoadDatabaseFailedAction {}

class LockDatabaseAction {}

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
