import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';
import 'package:ysnpass/store/reducers/app_state_reducer.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

void main() {
  group('Database Reducer', () {
    test('should change database in response to a DatabaseLoadedAction', () {
      final newDatabase = Database(name: 'new');

      final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
      );

      store.dispatch(DatabaseLoadedAction(newDatabase, 'masterpass'));

      expect(openedDatabaseSelector(store.state), newDatabase);
      expect(store.state.openedDatabaseName, 'new');
    });
    test('should add password to the list on SavePasswordAction', () {
      final emptyDatabase = Database(name: '1234');
      final newPassword = PasswordEntry('username', 'password');
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(loadedDatabase: emptyDatabase),
      );

      store.dispatch(
        SavePasswordAction(newPassword),
      );

      expect(passwordEntriesSelector(store.state), [newPassword]);
    });
    test('should edit password on SavePasswordAction', () {
      final newPassword = PasswordEntry('username', 'password', id: '1234');
      final changedPassword = PasswordEntry('changed', 'changed', id: '1234');
      final filledDatabase =
          Database(name: '1234', passwordEntries: [newPassword]);
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(loadedDatabase: filledDatabase),
      );

      store.dispatch(
        SavePasswordAction(changedPassword),
      );

      expect(passwordEntriesSelector(store.state), [changedPassword]);
    });
    test('should remove password on RemovePasswordAction', () {
      final newPassword = PasswordEntry('username', 'password', id: '1234');
      final filledDatabase =
          Database(name: '1234', passwordEntries: [newPassword]);
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(loadedDatabase: filledDatabase),
      );

      store.dispatch(
        RemovePasswordAction('1234'),
      );

      expect(passwordEntriesSelector(store.state), []);
    });
  });
  group('Database Names Reducer', () {
    test('should add database to list on DatabaseCreatedAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
      );

      store.dispatch(DatabaseCreatedAction('name'));

      expect(databasesSelector(store.state), ['name']);
    });
    test('should remove database from list on RemoveDatabaseAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(databaseNames: ['name1', 'name2']),
      );

      store.dispatch(
        RemoveDatabaseAction('name2'),
      );

      expect(databasesSelector(store.state), ['name1']);
    });
  });
  group('Opened Database Name Reducer', () {
    test('should change to database name of newly loaded database', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
      );

      store.dispatch(
        DatabaseLoadedAction(Database(name: 'new'), 'masterpass'),
      );

      expect(store.state.openedDatabaseName, 'new');
    });
    test('should be empty after database locked', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(openedDatabaseName: 'locked'),
      );

      store.dispatch(LockDatabaseAction());

      expect(store.state.openedDatabaseName, '');
    });
  });
  group('Master Password Reducer', () {
    test('should change master password to that of newly loaded database', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
      );

      store.dispatch(
        DatabaseLoadedAction(Database(), 'masterpass'),
      );

      expect(masterPasswordSelector(store.state), 'masterpass');
    });
    test('should be empty after database locked', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(masterPassword: 'locked'),
      );

      store.dispatch(LockDatabaseAction());

      expect(masterPasswordSelector(store.state), '');
    });
  });
  group('Login Successful Reducer', () {
    test('should set to true when new database is loaded', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
      );

      store.dispatch(
        DatabaseLoadedAction(Database(), ''),
      );

      expect(store.state.loginSuccessful, true);
    });
    test('should set to false when database load failed', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(),
      );

      store.dispatch(
        LoadDatabaseFailedAction(),
      );

      expect(store.state.loginSuccessful, false);
    });
    test('should set to null when database is locked', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState(loginSuccessful: true),
      );

      store.dispatch(LockDatabaseAction());

      expect(store.state.loginSuccessful, null);
    });
  });
}
