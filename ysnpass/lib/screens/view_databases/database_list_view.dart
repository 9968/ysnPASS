import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

class DatabaseListViewModel {
  final List<String> databaseList;
  final Function loadDatabase;

  DatabaseListViewModel(this.databaseList, this.loadDatabase);
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
            ),
        builder: (context, databaseListViewModel) {
          return ListView(
              children: databaseListViewModel.databaseList
                  .map((database) => ListTile(
                        title: Text(database),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          databaseListViewModel.loadDatabase(database);
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
