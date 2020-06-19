import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/edit_password/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/password_entry.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

import 'delete_password_entry_button.dart';

class ViewPasswordEntryModel {
  final PasswordEntry passwordEntry;
  final Function deletePassword;

  ViewPasswordEntryModel(this.passwordEntry, this.deletePassword);
}

class ViewPasswordEntry extends StatelessWidget {
  final String passwordId;

  ViewPasswordEntry(this.passwordId);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewPasswordEntryModel>(
        converter: (store) => ViewPasswordEntryModel(
              passwordEntriesSelector(store.state)
                  .firstWhere((password) => password.id == passwordId),
              () => store.dispatch(
                RemovePasswordAction(passwordId, store.state.openedDatabaseId),
              ),
            ),
        builder: (context, viewPasswordEntryModel) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Password'),
            ),
            body: Column(
              children: [
                Text(viewPasswordEntryModel.passwordEntry.username),
                Text(viewPasswordEntryModel.passwordEntry.password),
                DeletePasswordEntryButton(
                    deleteCallback: viewPasswordEntryModel.deletePassword),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPasswordScreen(
                        passwordEntry: viewPasswordEntryModel.passwordEntry),
                  ),
                );
              },
            ),
          );
        });
  }
}
