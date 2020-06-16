import 'package:flutter/material.dart';
import 'package:ysnpass/model/password.dart';

class ViewPassword extends StatelessWidget {
  final Password password;

  ViewPassword(this.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
      ),
      body: Column(
        children: [
          Text(password.username),
          Text(password.password),
        ],
      ),
    );
  }
}
