import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/password_entry.dart';

import 'delete_password_entry_button.dart';

class ViewPasswordEntry extends StatelessWidget {
  final PasswordEntry passwordEntry;

  ViewPasswordEntry(this.passwordEntry);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Function>(
        converter: (store) =>
            () => store.dispatch(RemovePasswordAction(passwordEntry.id)),
        builder: (context, deleteCallback) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Password'),
            ),
            body: Column(
              children: [
                Text(passwordEntry.username),
                Text(passwordEntry.password),
                DeletePasswordEntryButton(deleteCallback: deleteCallback),
              ],
            ),
          );
        });
  }
}
