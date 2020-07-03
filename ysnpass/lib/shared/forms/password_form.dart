import 'package:flutter/material.dart';
import 'package:ysnpass/store/models/password_entry.dart';

class PasswordForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Function(PasswordEntry) onSubmit;
  final PasswordEntry passwordEntry;

  PasswordForm({@required this.onSubmit, this.passwordEntry});
  @override
  Widget build(BuildContext context) {
    var name = passwordEntry?.name;
    var username = passwordEntry?.username;
    var password = passwordEntry?.password;

    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              key: Key('name'),
              decoration: InputDecoration(labelText: 'name'),
              initialValue: name,
              onChanged: (value) => name = value,
              validator: (value) =>
                  value.isEmpty ? 'Please enter a name' : null,
            ),
            TextFormField(
              key: Key('username'),
              initialValue: username,
              onChanged: (value) => username = value,
              decoration: InputDecoration(labelText: 'username'),
              validator: (value) =>
                  value.isEmpty ? 'Please enter an username' : null,
            ),
            TextFormField(
              key: Key('password'),
              initialValue: password,
              onChanged: (value) => password = value,
              decoration: InputDecoration(labelText: 'password'),
              obscureText: true,
              validator: (value) =>
                  value.isEmpty ? 'Please enter a password' : null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('CANCEL'),
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      onSubmit(
                        PasswordEntry(
                          name,
                          username,
                          password,
                          id: passwordEntry?.id,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('SAVE PASSWORD'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
