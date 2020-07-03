import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:ysnpass/screens/view_databases/index.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/models/app_state.dart';

class YsnPassApp extends StatelessWidget {
  final Store<AppState> store;

  const YsnPassApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
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
        home: ViewDatabases(
            onInit: () => store.dispatch(LoadDatabaseNamesAction())),
      ),
    );
  }
}
