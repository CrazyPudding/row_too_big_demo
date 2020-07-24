import 'package:flutter/material.dart';
import 'package:flutterapp/dbtest/db_provider.dart';
import 'package:flutterapp/dbtest/db_record.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _result = 'Tap the button to insert';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Migration'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                _result,
              ),
              FlatButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  DBProvider.insert(DBRecord(
                    column1: 'column1Value',
                    column2: 'column2Value',
                    column3: 'column3Value',
                    column4: 'column4Value',
                    column5: 'column5Value',
                  )).then((record) {
                    setState(() {
                      _result = record.toMap().toString();
                    });
                  });
                },
                child: Text('Insert a record'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
