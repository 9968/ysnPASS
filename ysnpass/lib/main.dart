import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/database_list.dart';
import 'model/database.dart';
import 'screens/view_databases/index.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DatabaseList()),
        ChangeNotifierProxyProvider<DatabaseList, Database>(
          create: (_) => Database(),
          update: (_, databaseList, database) =>
              database.load(databaseList.openedDatabase),
        ),
      ],
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
