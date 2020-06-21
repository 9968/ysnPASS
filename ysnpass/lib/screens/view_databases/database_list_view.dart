import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

class DatabaseListViewModel {
  final List<String> databaseList;
  final Function loadDatabase;
  final Function removeDatabase;

  DatabaseListViewModel(
      this.databaseList, this.loadDatabase, this.removeDatabase);
}

class DatabaseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DatabaseListViewModel>(
        converter: (store) => DatabaseListViewModel(
              databasesSelector(store.state),
              (databaseName) => store.dispatch(
                LoadDatabaseAction(databaseName),
              ),
              (databaseName) => store.dispatch(
                RemoveDatabaseAction(databaseName),
              ),
            ),
        builder: (context, databaseListViewModel) {
          return ListView(
              children: databaseListViewModel.databaseList
                  .map((databaseName) => ListTile(
                        title: Text(databaseName),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => databaseListViewModel
                              .removeDatabase(databaseName),
                        ),
                        onTap: () {
                          databaseListViewModel.loadDatabase(databaseName);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewDatabase()),
                          );
                        },
                      ))
                  .toList());
        });
  }
}
