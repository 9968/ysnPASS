import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ysnpass/store/models/password_entry.dart';

part 'database.g.dart';

@immutable
@JsonSerializable()
class Database {
  final String name;
  final List<PasswordEntry> passwordEntries;
  final String selectedPasswordId;

  Database({
    this.name,
    this.passwordEntries = const [],
    this.selectedPasswordId,
  });

  Database copyWith(
      {String name,
      List<PasswordEntry> passwordEntries,
      String selectedPasswordId}) {
    return Database(
      name: name ?? this.name,
      passwordEntries: passwordEntries ?? this.passwordEntries,
      selectedPasswordId: selectedPasswordId ?? this.selectedPasswordId,
    );
  }

  factory Database.fromJson(Map<String, dynamic> json) =>
      _$DatabaseFromJson(json);

  Map<String, dynamic> toJson() => _$DatabaseToJson(this);
}
