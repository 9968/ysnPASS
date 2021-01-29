import 'package:flutter/material.dart';
import 'package:ysnpass/screens/view_databases/index.dart';
import 'package:ysnpass/state/app_state.dart';
import 'package:provider/provider.dart';

class YsnPassApp extends StatelessWidget {
  const YsnPassApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'ysnPASS',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
          canvasColor: Color(0xFF212D3C),
          dialogBackgroundColor: Color(0xFF151d27),
          primaryColor: Color(0xFF151d27),
          buttonColor: Color(0xFF151d27),
          accentColor: Colors.blue,
        ),
        home: ViewDatabases(),
      ),
    );
  }
}
