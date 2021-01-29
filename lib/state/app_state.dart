import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ysnpass/filesystem/database_filesystem.dart';
import 'package:ysnpass/state/password_entry.dart';

import 'database.dart';

class AppState extends ChangeNotifier {
  List<String> _databaseNames;
  Database _loadedDatabase;
  String _masterPassword = '';
  bool _unlockFailed = false;
  final DatabaseFileSystem _databaseFileSystem = DatabaseFileSystem();

  UnmodifiableListView get passwords =>
      UnmodifiableListView(_loadedDatabase.passwordEntries);

  List<String> get databases {
    if (_databaseNames == null) {
      loadDatabaseNames();
      return List.empty();
    }
    return List.of(_databaseNames);
  }

  bool get unlockFailed => _unlockFailed;

  void loadDatabaseNames() async {
    _databaseNames = await _databaseFileSystem.getDatabaseNames();
    notifyListeners();
  }

  void removeDatabase(String databaseName) async {
    _databaseNames.remove(databaseName);
    await _databaseFileSystem.removeDatabase(databaseName);
    notifyListeners();
  }

  Future<bool> unlockDatabase(
      String databaseName, String masterPassword) async {
    try {
      _loadedDatabase =
          await _databaseFileSystem.openDatabase(databaseName, masterPassword);
      _masterPassword = masterPassword;
      return true;
    } catch (e) {
      _unlockFailed = true;
      notifyListeners();
      return false;
    }
  }

  void lockDatabase() {
    _unlockFailed = false;
    _loadedDatabase = null;
  }

  void addDatabase(Database database, String masterPassword) async {
    _databaseNames.add(database.name);
    await _databaseFileSystem.saveDatabase(database, masterPassword);
    notifyListeners();
  }

  void deletePassword(PasswordEntry entry) async {
    _loadedDatabase.passwordEntries.remove(entry);
    await _databaseFileSystem.saveDatabase(_loadedDatabase, _masterPassword);
    notifyListeners();
  }

  void savePassword(PasswordEntry entry) async {
    final index = _loadedDatabase.passwordEntries
        .indexWhere((passwordEntry) => passwordEntry.id == entry.id);

    if (index >= 0) {
      _loadedDatabase.passwordEntries[index] = entry;
    } else {
      _loadedDatabase.passwordEntries.add(entry);
    }
    await _databaseFileSystem.saveDatabase(_loadedDatabase, _masterPassword);
    notifyListeners();
  }
}
