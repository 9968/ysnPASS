import 'dart:collection';
import 'package:flutter/material.dart';
import 'database.dart';

class DatabaseList extends ChangeNotifier {
  final List<Database> _databases = [];
  Database _openedDatabase;

  List<Database> get databases => UnmodifiableListView(_databases);
  Database get openedDatabase => _openedDatabase;

  void addDatabase(Database database) {
    _databases.add(database);
    notifyListeners();
  }

  void openDatabase(String name) {
    _openedDatabase =
        _databases.firstWhere((database) => database.name == name);
        
  }
}
