import 'package:flutter/material.dart';
import 'password.dart';

class Database extends ChangeNotifier {
  String name;
  List<Password> _passwordList = [];

  Database();
  Database.name(this.name);

  void addPassword(Password password) {
    _passwordList.add(password);
    notifyListeners();
  }

  Database load(Database database) {
    this.name = database.name;
    this._passwordList = database._passwordList;
    notifyListeners();
    return this;
  }
}
