import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

List<Database> databasesSelector(AppState state) => state.databases;

Database openedDatabaseSelector(AppState state) => state.openedDatabase;

List<PasswordEntry> passwordEntriesSelector(AppState state) => state.openedDatabase.passwordEntries;