import 'package:flutter_test/flutter_test.dart';
import 'package:ysnpass/store/actions/actions.dart';
import 'package:ysnpass/store/reducers/opened_database_reducer.dart';

void main() {
  test('should change opened database id', () {
    final openedDatabase = openedDatabaseReducer('old', OpenDatabaseAction('new'));

    expect(openedDatabase, 'new'); 
  });
}