import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ysnpass/filesystem/database_filesystem.dart';
import 'package:ysnpass/store/models/database.dart';

// THESE TESTS NEED TO BE RUN TOGETHER -> TEST 2 DEPENDS ON OUTPUT OF TEST 1
// This also tests Encryption methods -> not so nice
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final DatabaseFileSystem fileSystem = DatabaseFileSystem();
  final mockDatabase = Database(name: 'database');
  Directory directory;

  setUpAll(() async {
    // Create a temporary directory.
    directory = await Directory.systemTemp.createTemp();

    // Mock out the MethodChannel for the path_provider plugin.
    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      // If you're getting the apps documents directory, return the path to the
      // temp directory on the test environment instead.
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return directory.path;
      }
      return null;
    });
  });
  group('Database Filesystem', () {
    test('should save database', () async {
      final file =
          await fileSystem.saveDatabase(mockDatabase, 'masterpassword');

      expect(file, isNotNull);
      expect(directory.listSync().length, 1);
    });

    test('should get database name', () async {
      List<String> databaseNames = await fileSystem.getDatabaseNames();

      expect(databaseNames, [endsWith(mockDatabase.name)]);
    });

    test('should read database file', () async {
      final database =
          await fileSystem.openDatabase('database', 'masterpassword');

      expect(database.name, mockDatabase.name);
    });

    test('should delete database file', () async {
      await fileSystem.removeDatabase('database');

      expect(directory.listSync().length, 0);
    });
  });
}
