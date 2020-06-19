import 'package:flutter/material.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/store/models/database.dart';

class CreateDatabaseForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formController = TextEditingController();
  final Function(Database) onCreate;

  CreateDatabaseForm({@required this.onCreate});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _formController,
            validator: (value) =>
                value.isEmpty ? 'Please enter a name for your database' : null,
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                onCreate(Database(name: _formController.text));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ViewDatabase()),
                );
              }
            },
            child: Text('CREATE'),
          ),
        ],
      ),
    );
  }
}
