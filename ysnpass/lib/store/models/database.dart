import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:ysnpass/store/models/password_entry.dart';

@immutable
class Database {
  final String id;
  final String name;
  final List<PasswordEntry> passwordEntries;
  final String selectedPasswordId;

  Database(
      {this.name,
      this.passwordEntries = const [],
      this.selectedPasswordId,
      String id})
      : id = id ?? Uuid().v4();

  Database copyWith(
      {String id,
      String name,
      List<PasswordEntry> passwordEntries,
      String selectedPasswordId}) {
    return Database(
      id: id ?? this.id,
      name: name ?? this.name,
      passwordEntries: passwordEntries ?? this.passwordEntries,
      selectedPasswordId: selectedPasswordId ?? this.selectedPasswordId,
    );
  }
}
