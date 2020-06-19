import 'package:flutter/material.dart';
import 'package:ysnpass/screens/edit_password/index.dart';
import 'package:ysnpass/screens/view_password/view_password_entry_model.dart';

import 'delete_password_entry_button.dart';

class ViewPasswordEntry extends StatelessWidget {
  final ViewPasswordEntryModel viewPasswordEntryModel;

  ViewPasswordEntry(this.viewPasswordEntryModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: Column(
        children: [
          Text(viewPasswordEntryModel.passwordEntry.username),
          Text(viewPasswordEntryModel.passwordEntry.password),
          DeletePasswordEntryButton(
              deleteCallback: viewPasswordEntryModel.deletePassword),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPasswordScreen(
                  passwordEntry: viewPasswordEntryModel.passwordEntry),
            ),
          );
        },
      ),
    );
  }
}
