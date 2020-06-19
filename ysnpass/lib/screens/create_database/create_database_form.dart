import 'package:flutter/material.dart';
import 'package:ysnpass/screens/create_database/create_database_button.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/store/models/database.dart';

class CreateDatabaseForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formController = TextEditingController();
  final Function(Database) onCreate;

  CreateDatabaseForm({@required this.onCreate});

  @override
  Widget build(BuildContext context) {
    final onClick = () {
      onCreate(Database(name: _formController.text));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ViewDatabase()),
      );
    };
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _formController,
            validator: (value) =>
                value.isEmpty ? 'Please enter a name for your database' : null,
          ),
          CreateDatabaseButton(
              validate: () => _formKey.currentState.validate(), onClick: onClick)
        ],
      ),
    );
  }
}
