import 'package:flutter/material.dart';
import 'package:ysnpass/screens/view_password/view_password_entry.dart';

class ViewPasswordContainer extends StatelessWidget {
  final String passwordId;

  ViewPasswordContainer(this.passwordId);

  @override
  Widget build(BuildContext context) {
    return ViewPasswordEntry(passwordId);
  }
}
