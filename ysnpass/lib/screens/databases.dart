import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/databasepool_model.dart';

import 'create_database.dart';

class Databases extends StatefulWidget {
  @override
  _DatabasesState createState() => _DatabasesState();
}

class _DatabasesState extends State<Databases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Databases'),
      ),
      body: Consumer<DatabasePoolModel>(
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
