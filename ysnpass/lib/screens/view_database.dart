import 'package:flutter/material.dart';

class ViewDatabase extends StatefulWidget {
  @override
  _ViewDatabaseState createState() => _ViewDatabaseState();
}

class _ViewDatabaseState extends State<ViewDatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
      ),
    );
  }
}
