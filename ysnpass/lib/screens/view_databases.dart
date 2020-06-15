import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/database_list.dart';

import 'create_database.dart';

class ViewDatabases extends StatefulWidget {
  @override
  _ViewDatabasesState createState() => _ViewDatabasesState();
}

class _ViewDatabasesState extends State<ViewDatabases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Databases'),
      ),
      body: Consumer<DatabaseList>(
        builder: (context, databasePool, child) => Column(
          children: <Widget>[
            Expanded(
                child: ListView(
              children: databasePool.databases
                  .map((database) => ListTile(
                        title: Text(database.name),
                      ))
                  .toList(),
            )),
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
      ),
    );
  }
}
