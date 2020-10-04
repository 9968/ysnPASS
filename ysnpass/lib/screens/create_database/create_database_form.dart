import 'package:flutter/material.dart';
import 'package:ysnpass/screens/create_database/create_database_button.dart';
import 'package:ysnpass/state/database.dart';

class CreateDatabaseForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _databaseNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final Function(Database, String) onCreate;

  CreateDatabaseForm({@required this.onCreate});

  @override
  Widget build(BuildContext context) {
    final onClick = () {
      onCreate(
        Database(
          name: _databaseNameController.text,
        ),
        _passwordController.text,
      );
    };
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: Key('database-name'),
            controller: _databaseNameController,
            validator: (value) =>
                value.isEmpty ? 'Please enter a name for your database' : null,
          ),
          TextFormField(
            key: Key('master-password'),
            controller: _passwordController,
            obscureText: true,
            validator: (value) => value.isEmpty
                ? 'Please enter a password for your database'
                : null,
          ),
          CreateDatabaseButton(
              validate: () => _formKey.currentState.validate(),
              onClick: onClick)
        ],
      ),
    );
  }
}
