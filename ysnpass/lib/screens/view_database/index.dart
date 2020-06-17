import 'package:flutter/material.dart';
import 'package:ysnpass/screens/view_database/add_password_button.dart';
import 'package:ysnpass/screens/view_database/password_list_view.dart';

class ViewDatabase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
      ),
      body: PasswordListView(),
      floatingActionButton: AddPasswordButton(),
    );
  }
}
