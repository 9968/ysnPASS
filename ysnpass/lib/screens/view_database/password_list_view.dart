import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:ysnpass/screens/view_password/index.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/password_entry.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

class PasswordListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<PasswordEntry>>(
        converter: (Store<AppState> store) {
      return passwordEntriesSelector(store.state);
    }, builder: (context, passwordList) {
      return ListView(
        children: passwordList
            .map(
              (password) => ListTile(
                title: Text(password.username),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ViewPasswordEntry(password),
                  ),
                ),
              ),
            )
            .toList(),
      );
    });
  }
}
