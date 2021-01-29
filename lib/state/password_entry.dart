import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'password_entry.g.dart';

@JsonSerializable()
class PasswordEntry {
  final String id;
  final String name;
  final String username;
  final String password;

  PasswordEntry.empty()
      : id = '',
        name = '',
        username = '',
        password = '';
  PasswordEntry(this.name, this.username, this.password, {String id})
      : id = id ?? Uuid().v4();

  factory PasswordEntry.fromJson(Map<String, dynamic> json) =>
      _$PasswordEntryFromJson(json);
  Map<String, dynamic> toJson() => _$PasswordEntryToJson(this);
}
