import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';

class PasswordDialogModel {
  final Function loadDatabase;
  final Function lockDatabase;
  final bool unlockFailed;

  PasswordDialogModel({
    this.loadDatabase,
    this.lockDatabase,
    this.unlockFailed,
  });
}

class PasswordDialog extends StatelessWidget {
  final databaseName;
  PasswordDialog(this.databaseName);

  @override
  Widget build(BuildContext context) {
    String masterPassword;

    return StoreConnector<AppState, PasswordDialogModel>(
      converter: (store) {
        var unlockFailed;
        switch (store.state.loginSuccessful) {
          case true:
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => ViewDatabase()));
            unlockFailed = false;
            break;
          case false:
            unlockFailed = true;
            break;
          default:
            unlockFailed = false;
            break;
        }

        return PasswordDialogModel(
          loadDatabase: (databaseName, masterPasword) => store.dispatch(
            LoadDatabaseAction(databaseName, masterPassword),
          ),
          lockDatabase: () => store.dispatch(
            LockDatabaseAction(),
          ),
          unlockFailed: unlockFailed,
        );
      },
      builder: (context, PasswordDialogModel viewModel) => AlertDialog(
        title: Text('Enter master password'),
        content: TextFormField(
          autofocus: true,
          obscureText: true,
          onChanged: (value) => masterPassword = value,
          autovalidate: true,
          validator: (_) => viewModel.unlockFailed
              ? 'wrong password, please try again'
              : null,
        ),
        actions: [
          FlatButton(
            key: Key('cancel-button'),
            onPressed: () {
              viewModel.lockDatabase();
              Navigator.pop(context);
            },
            child: Text('CANCEL'),
          ),
          FlatButton(
            key: Key('unlock-button'),
            onPressed: () {
              viewModel.loadDatabase(databaseName, masterPassword);
            },
            child: Text('UNLOCK'),
          ),
        ],
      ),
    );
  }
}

Future<void> showPasswordDialog(context, {String databaseName}) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (context) {
        return PasswordDialog(databaseName);
      });
}
