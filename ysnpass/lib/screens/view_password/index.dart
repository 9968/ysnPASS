import 'package:flutter/material.dart';
import 'package:ysnpass/model/password_entry.dart';

class ViewPasswordEntry extends StatelessWidget {
  final PasswordEntry passwordEntry;

  ViewPasswordEntry(this.passwordEntry);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: Column(
        children: [
          Text(passwordEntry.username),
          Text(passwordEntry.password),
        ],
      ),
    );
  }
}
