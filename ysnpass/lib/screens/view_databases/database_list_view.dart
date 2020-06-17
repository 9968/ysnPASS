import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';
import 'package:ysnpass/store/selectors/selectors.dart';

class DatabaseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Database>>(
        converter: (store) => databasesSelector(store.state),
        builder: (context, databaseList) {
          return ListView(
              children: databaseList
                  .map((database) => ListTile(
                        title: Text(database.name),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
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
