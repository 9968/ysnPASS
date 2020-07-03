import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ysnpass/screens/view_database/add_password_button.dart';
import 'package:ysnpass/screens/view_database/password_list_view.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';

class ViewDatabase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
        leading: BackButton(onPressed: () {
          StoreProvider.of<AppState>(context).dispatch(LockDatabaseAction());
          Navigator.pop(context);
        }),
      ),
      body: PasswordListView(),
      floatingActionButton: AddPasswordButton(),
    );
  }
}
