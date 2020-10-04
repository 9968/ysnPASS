// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordEntry _$PasswordEntryFromJson(Map<String, dynamic> json) {
  return PasswordEntry(
    json['name'] as String,
    json['username'] as String,
    json['password'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$PasswordEntryToJson(PasswordEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
    };
