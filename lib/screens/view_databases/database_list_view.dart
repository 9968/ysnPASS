import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/screens/view_databases/request_password_dialog.dart';
import 'package:ysnpass/state/app_state.dart';

class DatabaseListViewModel {
  final List<String> databaseList;
  final Function removeDatabase;

  DatabaseListViewModel(
    this.databaseList,
    this.removeDatabase,
  );
}

class DatabaseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) => ListView(
        shrinkWrap: true,
        children: appState.databases
            .map(
              (databaseName) => ListTile(
                title: Text(databaseName),
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      appState.removeDatabase(databaseName);
                    }),
                onTap: () => _onTapDatabase(context, databaseName),
              ),
            )
            .toList(),
      ),
    );
  }

  _onTapDatabase(context, databaseName) async {
    await showPasswordDialog(context, databaseName: databaseName);
  }
}
