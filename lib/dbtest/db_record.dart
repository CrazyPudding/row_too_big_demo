import 'db_provider.dart';

class DBRecord {
  int id;
  String column1;
  String column2;
  String column3;
  String column4;
  String column5;

  // added in version 2
  String column6;
  String column7;
  String column8;
  String column9;

  DBRecord({
    this.id,
    this.column1,
    this.column2,
    this.column3,
    this.column4,
    this.column5,
    this.column6,
    this.column7,
    this.column8,
    this.column9,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName1: column1,
      columnName2: column2,
      columnName4: column4,
      columnName3: column3,
      columnName5: column5,
      columnName6: column6,
      columnName7: column7,
      columnName8: column8,
      columnName9: column9,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  DBRecord.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    column1 = map[columnName1];
    column2 = map[columnName2];
    column4 = map[columnName4];
    column3 = map[columnName3];
    column5 = map[columnName5];
    column6 = map[columnName6];
    column7 = map[columnName7];
    column8 = map[columnName8];
    column9 = map[columnName9];
  }
}
