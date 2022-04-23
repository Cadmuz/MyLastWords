import 'models/alarm_info.dart';

List<AlarmInfo> alarms = [
  AlarmInfo(
    alarmDateTime: DateTime.now().add(Duration(hours: 1)),
    title: 'Office',
    id: 0,
    isPending: true,
  ),
  AlarmInfo(
    alarmDateTime: DateTime.now().add(Duration(hours: 2)),
    title: 'Sport',
    id: 1,
    isPending: true,
  ),
];
