import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: Builder(
        builder: (context) => Column(children: [
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title:
                    Text(widget.viewPasswordEntryModel.passwordEntry.username),
              ),
              ListTile(
                title: Text(
                  showPassword
                      ? widget.viewPasswordEntryModel.passwordEntry.password
                      : String.fromCharCode(0x25CF) * 10,
                ),
                onLongPress: () => _copyToClipboard(context),
                trailing: IconButton(
                    key: Key('toggle-show-password'),
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: _toggleShowPassword),
              )
            ],
          ),
          DeletePasswordEntryButton(
              deleteCallback: widget.viewPasswordEntryModel.deletePassword),
        ]),
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
                  passwordEntry: widget.viewPasswordEntryModel.passwordEntry),
            ),
          );
        },
      ),
    );
  }

  _copyToClipboard(context) {
    Clipboard.setData(
      ClipboardData(text: widget.viewPasswordEntryModel.passwordEntry.password),
    );
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Copied to Clipboard'),
    ));
  }

  _toggleShowPassword() => setState(() {
        showPassword = !showPassword;
      });
}
