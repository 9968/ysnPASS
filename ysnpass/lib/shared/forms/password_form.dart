import 'package:flutter/material.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class PasswordForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _userNameController;
  final _passwordController;
  final Function(PasswordEntry) onSubmit;
  final PasswordEntry passwordEntry;

  PasswordForm({@required this.onSubmit, this.passwordEntry})
      : _userNameController =
            TextEditingController(text: passwordEntry?.username),
        _passwordController =
            TextEditingController(text: passwordEntry?.password);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _userNameController,
            validator: (value) =>
                value.isEmpty ? 'Please enter an username' : null,
          ),
          TextFormField(
            controller: _passwordController,
            validator: (value) =>
                value.isEmpty ? 'Please enter a password' : null,
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                onSubmit(PasswordEntry(
                    _userNameController.text, _passwordController.text,
                    id: passwordEntry?.id));
                Navigator.pop(context);
              }
            },
            child: Text('SAVE PASSWORD'),
          ),
        ],
      ),
    );
  }
}
