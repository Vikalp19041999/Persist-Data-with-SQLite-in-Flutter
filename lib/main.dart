import 'package:flutter/material.dart';
import 'package:persist_data_with_sqlite/database_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persist Data with SQLite'),
        centerTitle: true,
        backgroundColor: Colors.black26,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            RaisedButton(
                onPressed: () {
                  _insert();
                },
                child: Text(
                  'Insert Data',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black26),
            Padding(padding: EdgeInsets.all(15)),
            RaisedButton(
                onPressed: () {
                  _retrieve();
                },
                child: Text(
                  'Retrieve Data',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black26),
            Padding(padding: EdgeInsets.all(15)),
            RaisedButton(
                onPressed: () {
                  _update();
                },
                child: Text(
                  'Update Data',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black26),
            Padding(padding: EdgeInsets.all(15)),
            RaisedButton(
                onPressed: () {
                  _delete();
                },
                child: Text(
                  'Delete Data',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black26),
            Padding(padding: EdgeInsets.all(15)),
          ])),
    );
  }

  void _insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'Vikalp',
      DatabaseHelper.columnAge: 20
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _retrieve() async {
    final allRows = await dbHelper.queryAllRows();
    print('All Data:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: 'Vicky',
      DatabaseHelper.columnAge: 32
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
