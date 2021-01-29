import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/state/app_state.dart';

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

class PasswordDialog extends AlertDialog {
  final databaseName;
  PasswordDialog(this.databaseName) : super();

  @override
  Widget build(BuildContext context) {
    String masterPassword;

    return Consumer<AppState>(
      builder: (context, appState, _) => AlertDialog(
        title: Text('Enter master password'),
        content: TextFormField(
          autofocus: true,
          obscureText: true,
          onChanged: (value) => masterPassword = value,
          autovalidate: true,
          validator: (_) =>
              appState.unlockFailed ? 'wrong password, please try again' : null,
        ),
        actions: [
          FlatButton(
            key: Key('cancel-button'),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CANCEL'),
          ),
          FlatButton(
            key: Key('unlock-button'),
            onPressed: () async {
              if (await appState.unlockDatabase(databaseName, masterPassword)) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewDatabase(),
                    ));
              }
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
      barrierColor: Color(0xEE212D3C),
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (context) {
        return PasswordDialog(databaseName);
      });
}
