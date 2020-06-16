import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/database.dart';
import 'package:ysnpass/screens/view_database/add_password_button.dart';
import 'package:ysnpass/screens/view_database/password_list.dart';

class ViewDatabase extends StatefulWidget {
  @override
  _ViewDatabaseState createState() => _ViewDatabaseState();
}

class _ViewDatabaseState extends State<ViewDatabase> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(database.name),
      ),
      body: PasswordList(),
      floatingActionButton: AddPasswordButton(),
    );
  }
}
