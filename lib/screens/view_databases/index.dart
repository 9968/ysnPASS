import 'package:flutter/material.dart';
import 'package:ysnpass/screens/create_database/index.dart';
import 'package:ysnpass/screens/view_databases/database_list_view.dart';

class ViewDatabases extends StatefulWidget {
  final void Function() onInit;
  ViewDatabases({@required this.onInit});
  @override
  _ViewDatabasesState createState() => _ViewDatabasesState();
}

class _ViewDatabasesState extends State<ViewDatabases> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Databases'),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.43),
            child: DatabaseListView(),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('CREATE DATABASE'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateDatabase()),
              );
            },
          ),
        ],
      ),
    );
  }
}
