import 'package:flutter/material.dart';

class DeletePasswordEntryButton extends StatelessWidget {
  final Function deleteCallback;
  DeletePasswordEntryButton({@required this.deleteCallback});

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(Icons.delete),
      label: Text('DELETE PASSWORD'),
      onPressed: () {
        deleteCallback();
        Navigator.pop(context);
      },
    );
  }
}
