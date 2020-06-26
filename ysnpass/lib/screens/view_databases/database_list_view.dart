import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/screens/view_databases/request_password_dialog.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

class DatabaseListViewModel {
  final List<String> databaseList;
  final Function loadDatabase;
  final Function removeDatabase;

  DatabaseListViewModel(
    this.databaseList,
    this.loadDatabase,
    this.removeDatabase,
  );
}

class DatabaseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DatabaseListViewModel>(converter: (store) {
      if (!store.state.databaseLocked) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ViewDatabase(),
          ),
        );
      }
      return DatabaseListViewModel(
        databasesSelector(store.state),
        (databaseName, masterPassword) => store.dispatch(
          LoadDatabaseAction(databaseName, masterPassword),
        ),
        (databaseName) => store.dispatch(
          RemoveDatabaseAction(databaseName),
        ),
      );
    }, builder: (context, databaseListViewModel) {
      return ListView(
        children: databaseListViewModel.databaseList
            .map(
              (databaseName) => ListTile(
                title: Text(databaseName),
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      databaseListViewModel.removeDatabase(databaseName);
                    }),
                onTap: () => _onTapDatabase(
                    context, databaseListViewModel, databaseName),
              ),
            )
            .toList(),
      );
    });
  }

  _onTapDatabase(context, databaseListViewModel, databaseName) async {
    final masterPassword = await showPasswordDialog(context, false);
    databaseListViewModel.loadDatabase(databaseName, masterPassword);
  }
}
