import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';

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
            StoreConnector<AppState, void Function(Database)>(
                converter: (store) => (database) {
                      store.dispatch(AddDatabaseAction(database));
                      store.dispatch(OpenDatabaseAction(database));
                    },
                builder: (context, addCallback) {
                  return RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addCallback(Database(name: _formController.text));

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewDatabase()),
                        );
                      }
                    },
                    child: Text('CREATE'),
                  );
                }),
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
