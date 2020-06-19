import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/shared/forms/password_form.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class EditPasswordForm extends StatelessWidget {
  final PasswordEntry passwordEntry;

  EditPasswordForm(this.passwordEntry);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void Function(PasswordEntry)>(
        converter: (store) => (passwordEntry) => store.dispatch(
            SavePasswordAction(passwordEntry, store.state.openedDatabaseId)),
        builder: (context, onSave) {
          return PasswordForm(
            onSubmit: onSave,
            passwordEntry: passwordEntry,
          );
        });
  }
}
