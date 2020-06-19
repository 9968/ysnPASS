import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';
import 'package:ysnpass/store/reducers/databases_reducer.dart';

void main() {
  Reducer<List<Database>> reducer;
  setUp(() {
    reducer = databasesReducer;
  });
  group('databases reducer', () {
    test('should add database', () {
      final newDatabase = Database(id: 'new');

      final reducedList = reducer([], SaveDatabaseAction(newDatabase));

      expect(reducedList.length, 1);
      expect(reducedList[0].id, 'new');
    });
    test('should edit database', () {
      final editedDatabase = Database(id: 'new', name: 'edit');

      final reducedList = reducer([Database(id: 'new', name: 'new')],
          SaveDatabaseAction(editedDatabase));

      expect(reducedList.length, 1);
      expect(reducedList[0].id, 'new');
      expect(reducedList[0].name, 'edit');
    });
    test('should add password', () {
      final emptyDatabase = Database(id: '1234');

      final reducedList = reducer([emptyDatabase],
          SavePasswordAction(PasswordEntry('username', 'password'), '1234'));

      expect(reducedList[0].passwordEntries.length, 1);
      expect(reducedList[0].passwordEntries[0].username, 'username');
      expect(reducedList[0].passwordEntries[0].password, 'password');
    });
    test('should edit password', () {
      final filledDatabase = Database(
          id: '1234',
          passwordEntries: [PasswordEntry('username', 'password', id: '1234')]);

      final reducedList = reducer(
          [filledDatabase],
          SavePasswordAction(
              PasswordEntry('username', 'edited', id: '1234'), '1234'));

      expect(reducedList[0].passwordEntries.length, 1);
      expect(reducedList[0].passwordEntries[0].username, 'username');
      expect(reducedList[0].passwordEntries[0].password, 'edited');
    });
    test('should remove password', () {
      final filledDatabase = Database(
          id: '1234',
          passwordEntries: [PasswordEntry('username', 'password', id: '1234')]);

      final reducedList = reducer(
          [filledDatabase],
          RemovePasswordAction('1234', '1234'));

      expect(reducedList[0].passwordEntries.length, 0);
    });
  });
}
