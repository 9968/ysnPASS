import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/state/app_state.dart';

class DeletePasswordEntryButton extends StatelessWidget {
  final entry;
  DeletePasswordEntryButton(this.entry);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(Icons.delete),
      label: Text('DELETE PASSWORD'),
      onPressed: () {
        Provider.of<AppState>(context, listen: false).deletePassword(entry);
        Navigator.pop(context);
      },
    );
  }
}
