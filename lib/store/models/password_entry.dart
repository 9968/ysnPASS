import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'password_entry.g.dart';

@immutable
@JsonSerializable()
class PasswordEntry {
  final String id;
  final String username;
  final String password;

  PasswordEntry(this.username, this.password, {String id})
      : id = id ?? Uuid().v4();

  factory PasswordEntry.fromJson(Map<String, dynamic> json) =>
      _$PasswordEntryFromJson(json);
  Map<String, dynamic> toJson() => _$PasswordEntryToJson(this);
}
