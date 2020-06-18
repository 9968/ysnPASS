import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class EditPasswordScreen extends StatelessWidget {
  final PasswordEntry passwordEntry;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController;
  final TextEditingController _passwordController;

  EditPasswordScreen({@required this.passwordEntry})
      : _userNameController =
            TextEditingController(text: passwordEntry.username),
        _passwordController =
            TextEditingController(text: passwordEntry.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Password Entry'),
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
                  store.dispatch(SavePasswordAction(passwordEntry)),
              builder: (context, onSave) {
                return RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      onSave(PasswordEntry(
                          _userNameController.text, _passwordController.text,
                          id: passwordEntry.id));
                      Navigator.pop(context);
                    }
                  },
                  child: Text('SAVE'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
