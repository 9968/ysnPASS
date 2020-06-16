import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/database.dart';
import 'package:ysnpass/model/password.dart';
import 'package:ysnpass/screens/view_database/index.dart';

class CreatePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _userNameController = TextEditingController();
    final _passwordController = TextEditingController();

    final database = Provider.of<Database>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Password'),
      ),
      body: Form(
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
                  database.addPassword(Password(
                      _userNameController.text, _passwordController.text));
                  Navigator.pop(context);
                }
              },
              child: Text('CREATE'),
            ),
          ],
        ),
      ),
    );
  }
}
