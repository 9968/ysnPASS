import 'package:flutter/material.dart';
import 'package:ysnpass/screens/create_password/create_password_form_container.dart';

class CreatePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Password'),
      ),
      body: CreatePasswordFromContainer(),
    );
  }
}
