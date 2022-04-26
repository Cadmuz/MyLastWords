// ignore_for_file: unused_field

import 'package:flutter_auth/models/alarm_info.dart';
import 'package:sqflite/sqflite.dart';

final String tblAlarm = 'alarm';
final String colId = 'id';
final String colTitle = 'title';
final String colDateTime = 'alarmDateTime';
final String colPending = 'isPending';

class AlarmHelper {
  static Database? _database;
  static AlarmHelper? _alarmHelper;

  AlarmHelper._createInstance();
  factory AlarmHelper() {
    if (_alarmHelper == null) {
      _alarmHelper = AlarmHelper._createInstance();
    }
    return _alarmHelper!;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializaDatabase();
    }
    return _database;
  }

  Future<Database?> initializaDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "alarm.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tblAlarm 
          (
            $colId integer primary key autoincrement,
            $colTitle text not null,
            $colDateTime text not null,
            $colPending bool not null
          )
        ''');
      },
    );
    return database;
  }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await this.database;
    var result = await db!.insert(tblAlarm, alarmInfo.toMap());
    print('result : $result');
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = [];
    var db = await this.database;
    var result = await db!.query(tblAlarm);
    result.forEach((element) {
      var alarmInfo = AlarmInfo.fromMap(element);
      _alarms.add(alarmInfo);
    });
    return _alarms;
  }
}
