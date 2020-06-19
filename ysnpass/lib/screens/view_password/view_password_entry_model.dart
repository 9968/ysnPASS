import 'package:ysnpass/store/models/password_entry.dart';

class ViewPasswordEntryModel {
  final PasswordEntry passwordEntry;
  final Function deletePassword;

  ViewPasswordEntryModel(this.passwordEntry, this.deletePassword);
}
