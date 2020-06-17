import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/password_entry.dart';

import 'delete_password_entry_button.dart';

class ViewPasswordEntry extends StatelessWidget {
  final PasswordEntry passwordEntry;

  ViewPasswordEntry(this.passwordEntry);

  @override
  Widget build(BuildContext context) {
    return Provider<PasswordEntry>(
        create: (_) => passwordEntry,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Password'),
          ),
          body: Column(
            children: [
              Text(passwordEntry.username),
              Text(passwordEntry.password),
              DeletePasswordEntryButton(),
            ],
          ),
        ));
  }
}
