import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ysnpass/model/password_entry.dart';

class Database extends ChangeNotifier {
  String name;
  List<PasswordEntry> _passwordList = [];

  Database();
  Database.name(this.name);

  UnmodifiableListView<PasswordEntry> get passwordList =>
      UnmodifiableListView(_passwordList);

  void addPassword(PasswordEntry passwordEntry) {
    _passwordList.add(passwordEntry);
    notifyListeners();
  }

  void removePassword(PasswordEntry passwordEntry) {
    _passwordList.remove(passwordEntry);
    notifyListeners();
  }

  Database load(Database database) {
    this.name = database.name;
    this._passwordList = database._passwordList;
    notifyListeners();
    return this;
  }
}
