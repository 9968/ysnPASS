import 'package:flutter/material.dart';
import 'package:ysnpass/screens/create_database/create_database_form_container.dart';

class CreateDatabase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Database'),
      ),
      body: CreatedatabaseformContainer(),
    );
  }
}
