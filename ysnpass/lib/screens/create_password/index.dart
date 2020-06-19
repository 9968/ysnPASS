import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class CreatePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _userNameController = TextEditingController();
    final _passwordController = TextEditingController();

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
            StoreConnector<AppState, void Function(PasswordEntry)>(
                converter: (store) => (passwordEntry) =>
                    store.dispatch(SavePasswordAction(passwordEntry, store.state.openedDatabaseId)),
                builder: (context, addCallback) {
                  return RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addCallback(PasswordEntry(_userNameController.text,
                            _passwordController.text));
                        Navigator.pop(context);
                      }
                    },
                    child: Text('CREATE'),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
