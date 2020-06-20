import 'package:flutter_test/flutter_test.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

void main() {
  final mockPasswordEntries = [PasswordEntry('username', 'password')];
  final mockSelectedDatabase =
      Database(name: '1234', passwordEntries: mockPasswordEntries);
  final mockDatabaseNames = ['0', '1', '1234'];

  final mockAppState = AppState(
      databaseNames: mockDatabaseNames,
      loadedDatabase: mockSelectedDatabase,
      openedDatabaseName: '1234');
  group('Selectors', () {
    test('should select databases', () {
      expect(databasesSelector(mockAppState), mockDatabaseNames);
    });
    test('should select open database', () {
      expect(openedDatabaseSelector(mockAppState), mockSelectedDatabase);
    });
    test('should select passwords from opened database', () {
      expect(passwordEntriesSelector(mockAppState), mockPasswordEntries);
    });
  });
}
