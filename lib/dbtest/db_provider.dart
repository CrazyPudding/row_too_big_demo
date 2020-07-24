import 'package:flutterapp/dbtest/db_record.dart';
import 'package:sqflite/sqflite.dart';

import 'db_util.dart';

const String tableName = 'table_name';
const String columnId = '_id';
const String columnName1 = 'column1';
const String columnName2 = 'column2';
const String columnName3 = 'column3';
const String columnName4 = 'column4';
const String columnName5 = 'column5';
const String columnName6 = 'column6';
const String columnName7 = 'column7';
const String columnName8 = 'column8';
const String columnName9 = 'column9';

class DBProvider {
  static const CREATE_TABLE = '''
    create table $tableName (
    $columnId integer primary key autoincrement,
    $columnName1 text not null,
    $columnName2 text not null,
    $columnName3 datetime default current_timestamp,
    $columnName5 text not null,
    $columnName4 text,
    $columnName6 text not null,
    $columnName7 text not null,
    $columnName8 text not null,
    $columnName9 text not null);
    ''';

  static const ALTER_TABLE_ADD_COLUMN6 =
      '''alter table $tableName add column $columnName6 text''';

  static const ALTER_TABLE_ADD_COLUMN7 = '''
    alter table $tableName add column $columnName7 text default 1;
    ''';

  static const ALTER_TABLE_ADD_COLUMN8 =
      '''alter table $tableName add column $columnName8 text''';
  static const ALTER_TABLE_ADD_COLUMN9 = '''
    alter table $tableName add column $columnName9 text''';

  static createCallRecordTable(Database db) async {
    await db.execute(CREATE_TABLE);
  }

  static migration_1_2(Database db) async {
    Batch batch = db.batch();
    batch.execute('$ALTER_TABLE_ADD_COLUMN8 default 1;');
    batch.execute(ALTER_TABLE_ADD_COLUMN7);
    batch.execute(ALTER_TABLE_ADD_COLUMN9);
    batch.execute('$ALTER_TABLE_ADD_COLUMN6 default valueDefault;');
    await batch.commit();
  }

  static Future<DBRecord> insert(DBRecord record) async {
    record.id =
        await DbUtil.getDb().then((db) => db.insert(tableName, record.toMap()));
    return record;
  }
}
