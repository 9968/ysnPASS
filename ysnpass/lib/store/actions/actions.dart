import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class OpenDatabaseAction {
  final String databaseId;
  OpenDatabaseAction(this.databaseId);
}

class SaveDatabaseAction {
  final Database database;
  SaveDatabaseAction(this.database);
}

class SavePasswordAction {
  final PasswordEntry passwordEntry;
  final String databaseId;
  SavePasswordAction(this.passwordEntry, this.databaseId);
}

class RemovePasswordAction {
  final String id;
  final String databaseId;
  RemovePasswordAction(this.id, this.databaseId);
}
