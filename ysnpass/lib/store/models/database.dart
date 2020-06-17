import 'package:flutter/foundation.dart';
import 'package:ysnpass/store/models/password_entry.dart';

@immutable
class Database {
  final String name;
  final List<PasswordEntry> passwordEntries;

  Database({this.name, this.passwordEntries = const []});
}
