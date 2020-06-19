import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

class DatabaseListViewModel {
  final List<Database> databaseList;
  final Function openDatabase;

  DatabaseListViewModel(this.databaseList, this.openDatabase);
}

class DatabaseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DatabaseListViewModel>(
        converter: (store) => DatabaseListViewModel(
              databasesSelector(store.state),
              (databaseId) => store.dispatch(
                OpenDatabaseAction(databaseId),
              ),
            ),
        builder: (context, databaseListViewModel) {
          return ListView(
              children: databaseListViewModel.databaseList
                  .map((database) => ListTile(
                        title: Text(database.name),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          databaseListViewModel.openDatabase(database.id);
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
