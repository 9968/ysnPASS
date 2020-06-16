import 'dart:collection';

import 'package:flutter/material.dart';
import 'password.dart';

class Database extends ChangeNotifier {
  String name;
  List<Password> _passwordList = [];

  Database();
  Database.name(this.name);

  UnmodifiableListView<Password> get passwordList =>
      UnmodifiableListView(_passwordList);

  void addPassword(Password password) {
    _passwordList.add(password);
    notifyListeners();
  }

  void removePassword(Password password) {
    _passwordList.remove(password);
  }

  Database load(Database database) {
    this.name = database.name;
    this._passwordList = database._passwordList;
    notifyListeners();
    return this;
  }
}
