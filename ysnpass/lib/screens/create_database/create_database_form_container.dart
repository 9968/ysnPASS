import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/view_database/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';
import 'package:ysnpass/store/models/database.dart';

import 'create_database_form.dart';

class CreatedatabaseformContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void Function(Database)>(
        converter: (store) => (database) {
              store.dispatch(CreateDatabaseAction(database));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => ViewDatabase(),
                ),
              );
            },
        builder: (context, onCreate) {
          return CreateDatabaseForm(onCreate: onCreate);
        });
  }
}
