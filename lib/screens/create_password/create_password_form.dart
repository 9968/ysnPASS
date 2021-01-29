import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/shared/forms/password_form.dart';
import 'package:ysnpass/state/app_state.dart';

class CreatePasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
        builder: (context, appState, _) =>
            PasswordForm(onSubmit: appState.savePassword));
  }
}
