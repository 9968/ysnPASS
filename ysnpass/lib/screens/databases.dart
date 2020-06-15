import 'package:flutter/material.dart';
import 'package:ysnpass/model/database_model.dart';

class Databases extends StatefulWidget {
  @override
  _DatabasesState createState() => _DatabasesState();
}

class _DatabasesState extends State<Databases> {
  List<Database> _databases = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Databases'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: _databases.map(
                (Database database) {
                  return ListTile(
                    title: Text(database.name),
                  );
                },
              ).toList(),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('CREATE DATABASE'),
            onPressed: _createDatabase,
          ),
        ],
      ),
    );
  }

  void _createDatabase() {
    setState(() {
      _databases.add(Database('name'));
    });
  }
}


