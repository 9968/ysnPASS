import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/models/password_entry.dart';

List<Database> databasesSelector(AppState state) => state.databases;

Database openedDatabaseSelector(AppState state) => state.databases
    .firstWhere((database) => database.id == state.openedDatabaseId);

List<PasswordEntry> passwordEntriesSelector(AppState state) =>
    openedDatabaseSelector(state).passwordEntries;
