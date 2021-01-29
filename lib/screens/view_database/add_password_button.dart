import 'package:flutter/material.dart';
import 'package:ysnpass/screens/create_password/index.dart';

class AddPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: Colors.blue,
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => CreatePassword()),
      ),
    );
  }
}
