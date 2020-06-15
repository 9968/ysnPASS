import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/database_list.dart';
import 'screens/view_databases.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DatabaseList(),
      child: YsnPass(),
    ),
  );
}

class YsnPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ysnPASS',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ViewDatabases(),
    );
  }
}
