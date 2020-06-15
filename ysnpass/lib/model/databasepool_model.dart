import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'database_model.dart';

class DatabasePoolModel extends ChangeNotifier {
  final List<DatabaseModel> _databases = [];

  UnmodifiableListView<DatabaseModel> get databases =>
      UnmodifiableListView(_databases);

  void add(DatabaseModel database) {
    _databases.add(database);
    notifyListeners();
  }
}
