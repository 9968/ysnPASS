import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/database_list.dart';
import 'package:ysnpass/screens/create_database/index.dart';
import 'package:ysnpass/screens/view_database/index.dart';

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
        builder: (context, databaseList, child) => Column(
          children: [
            Expanded(
                child: ListView(
              children: databaseList.databases
                  .map((database) => ListTile(
                        title: Text(database.name),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          databaseList.openDatabase(database.name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewDatabase()),
                          );
                        },
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
