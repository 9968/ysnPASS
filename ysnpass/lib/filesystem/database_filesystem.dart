import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
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

  Future<Database> openDatabase(String databaseName) async {
    final directory = await _directory;
    final databasePath = '${directory.path}/$databaseName.ysndb';
    final database = Database.fromJson(
      jsonDecode(
        File(databasePath).readAsStringSync(),
      ),
    );
    return database;
  }

  Future<File> saveDatabase(Database database) async {
    final directory = await _directory;
    final filePath = '${directory.path}/${database.name}.ysndb';
    return File(filePath).writeAsString(jsonEncode(database));
  }

  Future<Directory> get _directory {
    return getApplicationDocumentsDirectory();
  }
}
