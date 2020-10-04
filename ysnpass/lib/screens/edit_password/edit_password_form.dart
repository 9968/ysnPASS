import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/shared/forms/password_form.dart';
import 'package:ysnpass/state/app_state.dart';
import 'package:ysnpass/state/password_entry.dart';

class EditPasswordForm extends StatelessWidget {
  final PasswordEntry passwordEntry;

  EditPasswordForm(this.passwordEntry);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, _) {
      return PasswordForm(
        onSubmit: appState.savePassword,
        passwordEntry: passwordEntry,
      );
    });
  }
}
