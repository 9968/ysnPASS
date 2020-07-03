import 'package:flutter/material.dart';
import 'package:ysnpass/store/models/password_entry.dart';

import 'edit_password_form.dart';

class EditPasswordScreen extends StatelessWidget {
  final PasswordEntry passwordEntry;

  EditPasswordScreen({@required this.passwordEntry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Password Entry'),
      ),
      body: EditPasswordForm(passwordEntry),
    );
  }
}
