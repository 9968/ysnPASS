import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ysnpass/filesystem/database_filesystem.dart';
import 'package:ysnpass/store/models/database.dart';

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
      final file = await fileSystem.saveDatabase(mockDatabase);

      expect(file, isNotNull);
      expect(directory.listSync().length, 1);
    });

    test('should read database file', () async {
      final database = await fileSystem.openDatabase('database');

      expect(database.name, mockDatabase.name);
    });

    test('should delete database file', () async {
      await fileSystem.removeDatabase('database');

      expect(directory.listSync().length, 0);
    });
  });
}
