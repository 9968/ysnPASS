import 'package:flutter/material.dart';

import 'create_password_form.dart';

class CreatePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Password'),
      ),
      body: CreatePasswordForm(),
    );
  }
}
