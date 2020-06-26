import 'package:flutter/material.dart';

Future<String> showPasswordDialog(context, bool showWrongHint) async {
  String masterPassword = '';
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter master password'),
          content: Row(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  onChanged: (value) => masterPassword = value,
                  validator: (_) => showWrongHint ? 'password was wrong, please try again' : null,
                ),
              )
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context, masterPassword);
              },
              child: Text('OK'),
            ),
          ],
        );
      });
}
