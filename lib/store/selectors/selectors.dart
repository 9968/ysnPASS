import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

List<String> databasesSelector(AppState state) => state.databaseNames;

Database openedDatabaseSelector(AppState state) => state.loadedDatabase;

List<PasswordEntry> passwordEntriesSelector(AppState state) =>
    openedDatabaseSelector(state)?.passwordEntries ?? [];

String masterPasswordSelector(AppState state) => state.masterPassword;
