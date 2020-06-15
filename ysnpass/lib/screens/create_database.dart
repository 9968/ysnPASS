import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/database_model.dart';
import 'package:ysnpass/model/databasepool_model.dart';

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
        title: Text('Databases'),
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
                  Provider.of<DatabasePoolModel>(context, listen: false)
                      .add(DatabaseModel(_formController.text));
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
