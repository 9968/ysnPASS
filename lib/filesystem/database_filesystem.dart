import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:ysnpass/encryption/encryption.dart';
import 'package:ysnpass/store/models/database.dart';

class DatabaseFileSystem {
  Future<List<String>> getDatabaseNames() async {
    final directory = await _directory;
    return directory
        .listSync()
        .where(
          (file) => file.path.endsWith('.ysndb'),
        )
        .map((file) => file.path.substring(
            file.path.lastIndexOf('/') + 1, file.path.lastIndexOf('.')))
        .toList();
  }

  Future<Database> openDatabase(String databaseName, String masterPassword) async {
    final directory = await _directory;
    final databasePath = '${directory.path}/$databaseName.ysndb';
    final databaseBytes = File(databasePath).readAsBytesSync();

    return Encryption.decryptDB(databaseBytes, masterPassword);
  }

  Future<File> saveDatabase(Database database, String masterPassword) async {
    final encryptedDatabase = Encryption.encryptDB(database, masterPassword);
    final directory = await _directory;
    final filePath = '${directory.path}/${database.name}.ysndb';
    return File(filePath).writeAsBytes(encryptedDatabase);
  }

  removeDatabase(String databaseName) async {
    final file = await _databaseFile(databaseName);
    return file.delete();
  }

  Future<Directory> get _directory {
    return getApplicationDocumentsDirectory();
  }

  Future<File> _databaseFile(String databaseName) async {
    final directory = await _directory;
    return File('${directory.path}/$databaseName.ysndb');
  }
}
