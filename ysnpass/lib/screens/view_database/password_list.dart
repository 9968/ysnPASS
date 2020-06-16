import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/database.dart';

class PasswordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return ListView(
      children: database.passwordList
          .map(
            (password) => ListTile(
              title: Text(password.username),
            ),
          )
          .toList(),
    );
  }
}
