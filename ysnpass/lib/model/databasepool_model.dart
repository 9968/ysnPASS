import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'database_model.dart';

class DatabasePoolModel extends ChangeNotifier {
  final List<Database> _databases = [];

  UnmodifiableListView<Database> get databases =>
      UnmodifiableListView(_databases);

  void add(Database database) {
    _databases.add(database);
    notifyListeners();
  }
}
