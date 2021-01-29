import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/screens/view_password/index.dart';
import 'package:ysnpass/state/app_state.dart';

class PasswordListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, _) {
      return ListView(
        children: appState.passwords
            .map(
              (password) => ListTile(
                title: Text(password.name),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ViewPasswordContainer(password.id),
                  ),
                ),
              ),
            )
            .toList(),
      );
    });
  }
}
