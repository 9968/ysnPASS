// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Database _$DatabaseFromJson(Map<String, dynamic> json) {
  return Database(
    name: json['name'] as String,
    passwordEntries: (json['passwordEntries'] as List)
        ?.map((e) => e == null
            ? null
            : PasswordEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    selectedPasswordId: json['selectedPasswordId'] as String,
  );
}

Map<String, dynamic> _$DatabaseToJson(Database instance) => <String, dynamic>{
      'name': instance.name,
      'passwordEntries': instance.passwordEntries,
      'selectedPasswordId': instance.selectedPasswordId,
    };
