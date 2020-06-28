import 'package:flutter/material.dart';
import 'package:ysnpass/screens/edit_password/index.dart';
import 'package:ysnpass/screens/view_password/view_password_entry_model.dart';

import 'delete_password_entry_button.dart';

class ViewPasswordEntry extends StatefulWidget {
  final ViewPasswordEntryModel viewPasswordEntryModel;

  ViewPasswordEntry(this.viewPasswordEntryModel);

  @override
  _ViewPasswordEntryState createState() => _ViewPasswordEntryState();
}

class _ViewPasswordEntryState extends State<ViewPasswordEntry> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: Column(children: [
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text(widget.viewPasswordEntryModel.passwordEntry.username),
            ),
            ListTile(
              title: Text(
                showPassword
                    ? widget.viewPasswordEntryModel.passwordEntry.password
                    : String.fromCharCode(0x25CF) * 10,
              ),
              trailing: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: _toggleShowPassword),
            )
          ],
        ),
        DeletePasswordEntryButton(
            deleteCallback: widget.viewPasswordEntryModel.deletePassword),
      ]),
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
                  passwordEntry: widget.viewPasswordEntryModel.passwordEntry),
            ),
          );
        },
      ),
    );
  }

  _toggleShowPassword() => setState(() {
        showPassword = !showPassword;
      });
}
