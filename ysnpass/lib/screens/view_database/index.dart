import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/model/database.dart';

class ViewDatabase extends StatefulWidget {
  @override
  _ViewDatabaseState createState() => _ViewDatabaseState();
}

class _ViewDatabaseState extends State<ViewDatabase> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(database.name),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
