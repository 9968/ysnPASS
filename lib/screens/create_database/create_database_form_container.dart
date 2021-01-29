import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/state/app_state.dart';

import 'create_database_form.dart';

class CreatedatabaseformContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, _) {
      return CreateDatabaseForm(onCreate: appState.addDatabase);
    });
  }
}
