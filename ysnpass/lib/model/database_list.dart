import 'dart:collection';
import 'package:flutter/material.dart';
import 'database.dart';

class DatabaseList extends ChangeNotifier {
  final List<Database> _databases = [];

  UnmodifiableListView<Database> get databases =>
      UnmodifiableListView(_databases);

  void add(Database database) {
    _databases.add(database);
    notifyListeners();
  }
}
