import 'package:flutter/material.dart';

class CreateDatabaseButton extends StatelessWidget {
  final Function validate;
  final Function onClick;

  CreateDatabaseButton({@required this.validate, @required this.onClick});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (validate()) {
          onClick();
        }
      },
      child: Text('CREATE'),
    );
  }
}
