import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class OpenDatabaseAction {
  final Database database;
  OpenDatabaseAction(this.database);
}

class AddDatabaseAction {
  final Database database;
  AddDatabaseAction(this.database);
}

class AddPasswordAction {
  final PasswordEntry passwordEntry;
  AddPasswordAction(this.passwordEntry);
}

class RemovePasswordAction {
  final String id;
  RemovePasswordAction(this.id);
}
