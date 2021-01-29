import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/screens/view_database/add_password_button.dart';
import 'package:ysnpass/screens/view_database/password_list_view.dart';
import 'package:ysnpass/state/app_state.dart';

class ViewDatabase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<AppState>(context, listen: false).lockDatabase();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Database'),
        ),
        body: PasswordListView(),
        floatingActionButton: AddPasswordButton(),
      ),
    );
  }
}
