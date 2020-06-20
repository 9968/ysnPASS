import 'package:flutter/foundation.dart';
import 'package:ysnpass/store/models/database.dart';

@immutable
class AppState {
  final List<String> databaseNames;
  final String openedDatabaseName;
  final Database loadedDatabase;

  AppState(
      {this.databaseNames = const [],
      this.openedDatabaseName,
      this.loadedDatabase});
}
