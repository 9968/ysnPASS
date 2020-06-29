import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/view_password/view_password_entry.dart';
import 'package:ysnpass/screens/view_password/view_password_entry_model.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

class ViewPasswordContainer extends StatelessWidget {
  final String passwordId;

  ViewPasswordContainer(this.passwordId);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewPasswordEntryModel>(
        converter: (store) => ViewPasswordEntryModel(
              passwordEntriesSelector(store.state)
                  .firstWhere((password) => password.id == passwordId),
              () => store.dispatch(
                RemovePasswordAction(passwordId),
              ),
            ),
        builder: (context, viewPasswordEntryModel) {
          return ViewPasswordEntry(viewPasswordEntryModel);
        });
  }
}
