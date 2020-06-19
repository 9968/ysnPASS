import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

@immutable
class PasswordEntry {
  final String id;
  final String username;
  final String password;

  PasswordEntry(this.username, this.password, {String id})
      : id = id ?? Uuid().v4();
}
