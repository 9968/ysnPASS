import 'package:flutter/material.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class CreatePasswordForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final Function(PasswordEntry) onCreate;

  CreatePasswordForm({@required this.onCreate});

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
                onCreate(PasswordEntry(
                    _userNameController.text, _passwordController.text));
                Navigator.pop(context);
              }
            },
            child: Text('CREATE'),
          ),
        ],
      ),
    );
  }
}
