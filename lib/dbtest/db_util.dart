import 'dart:io';

import 'package:flutterapp/dbtest/db_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqflite_dev.dart';

class DbUtil {
  static Future<Database> _db;

  static Future<Database> getDb() {
    _db ??= DbUtil()._initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    await databaseFactory.setLogLevel(sqfliteLogLevelVerbose);

    final dbPath = await getDatabasesPath();
    final path = '$dbPath/test_db.db';

    print('dbPath: $path ---- Database init');

    if (!await Directory(dbPath).exists()) {
      try {
        await Directory(dbPath).create(recursive: true);
      } catch (e) {
        print('dbException: $e');
      }
    }

    final db = await openDatabase(path,
        version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  _onCreate(Database db, int version) async {
    print('onDBCreate ---- Database create');

    await DBProvider.createCallRecordTable(db);
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('data in DB before migration : \n ${await db.query('table_name')}');
    if (oldVersion < 2) {
      print('======Migrate kong.db from 1 to 2=====');
      await DBProvider.migration_1_2(db);
    }
    print('data in DB before migration : \n ${await db.query('table_name')}');

    // when I change to use this, it's ok
//    print(
//        'data in DB after migration : \n ${await db.rawQuery('select * from table_name')}');
  }
}
