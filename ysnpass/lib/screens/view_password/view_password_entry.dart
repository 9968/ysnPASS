import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/screens/edit_password/index.dart';
import 'package:ysnpass/state/app_state.dart';
import 'package:ysnpass/state/password_entry.dart';

import 'delete_password_entry_button.dart';

class ViewPasswordEntry extends StatefulWidget {
  final String passwordId;
  ViewPasswordEntry(this.passwordId);
  @override
  _ViewPasswordEntryState createState() => _ViewPasswordEntryState();
}

class _ViewPasswordEntryState extends State<ViewPasswordEntry> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, _) {
      PasswordEntry entry = appState.passwords.firstWhere(
        (element) => element.id == this.widget.passwordId,
        orElse: () => PasswordEntry.empty(),
      );
      return Scaffold(
        appBar: AppBar(
          title: Text(entry.name),
        ),
        body: Builder(
          builder: (context) => Column(children: [
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text(entry.username),
                ),
                ListTile(
                  title: Text(
                    showPassword
                        ? entry.password
                        : String.fromCharCode(0x25CF) * 10,
                  ),
                  onLongPress: () => _copyToClipboard(context, entry.password),
                  trailing: IconButton(
                      key: Key('toggle-show-password'),
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: _toggleShowPassword),
                )
              ],
            ),
            DeletePasswordEntryButton(entry),
          ]),
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
                builder: (context) => EditPasswordScreen(passwordEntry: entry),
              ),
            );
          },
        ),
      );
    });
  }

  _copyToClipboard(context, password) {
    Clipboard.setData(
      ClipboardData(text: password),
    );
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Copied to Clipboard'),
    ));
  }

  _toggleShowPassword() => setState(() {
        showPassword = !showPassword;
      });
}
