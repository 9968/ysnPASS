import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/database.dart';
import 'package:ysnpass/model/password_entry.dart';

class DeletePasswordEntryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    final passwordEntry = Provider.of<PasswordEntry>(context);
    return RaisedButton.icon(
      icon: Icon(Icons.delete),
      label: Text('DELETE PASSWORD'),
      onPressed: () {
        database.removePassword(passwordEntry);
        Navigator.pop(context);
      },
    );
  }
}
