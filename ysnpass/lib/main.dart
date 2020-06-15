import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ysnpass/screens/databases/databases.dart';

import 'model/databasepool_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DatabasePoolModel(),
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
      home: Databases(),
    );
  }
}
