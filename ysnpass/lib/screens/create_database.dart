import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/database.dart';
import 'package:ysnpass/model/database_list.dart';

import 'view_database.dart';

class CreateDatabase extends StatefulWidget {
  @override
  createState() => CreateDatabaseState();
}

class CreateDatabaseState extends State<CreateDatabase> {
  final _formKey = GlobalKey<FormState>();
  final _formController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Database'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _formController,
              validator: (value) => value.isEmpty
                  ? 'Please enter a name for your database'
                  : null,
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Provider.of<DatabaseList>(context, listen: false)
                      .add(Database(_formController.text));
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
      ),
    );
  }

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }
}
