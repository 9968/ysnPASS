import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:ysnpass/filesystem/database_filesystem.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/middleware/database_middleware.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';
import 'package:ysnpass/store/reducers/app_state_reducer.dart';

class MockDatabaseFileSystem extends Mock implements DatabaseFileSystem {}

void main() {
  DatabaseFileSystem mockDatabaseFileSystem;
  Store<AppState> store;
  final database = Database(name: 'database');
  final password = PasswordEntry('username', 'password');

  group('Database Middleware', () {
    setUp(() {
      mockDatabaseFileSystem = MockDatabaseFileSystem();
      when(mockDatabaseFileSystem.openDatabase(any))
          .thenAnswer((_) async => database);
      store = Store<AppState>(
        appReducer,
        initialState: AppState(loadedDatabase: database),
        middleware: createDatabaseMiddleware(mockDatabaseFileSystem),
      );
    });
    test('should load database names on a LoadDatabaseNamesAction', () {
      store.dispatch(LoadDatabaseNamesAction());

      verify(mockDatabaseFileSystem.getDatabaseNames());
    });
    test('should save database on every state changing action', () {
      store.dispatch(SaveDatabaseAction());
      store.dispatch(CreateDatabaseAction(database));
      store.dispatch(SavePasswordAction(password));
      store.dispatch(RemovePasswordAction('id'));

      verify(mockDatabaseFileSystem.saveDatabase(any)).called(4);
    });
    test('should remove database on RemoveDatabaseAction', () {
      store.dispatch(RemoveDatabaseAction(database.name));

      verify(mockDatabaseFileSystem.removeDatabase('database'));
    });
  });
}
