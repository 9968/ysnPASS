import 'package:flutter/material.dart';
import 'package:ysnpass/screens/databases.dart';

void main() {
  runApp(YsnPass());
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
