// ignore_for_file: deprecated_member_use, unused_field, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/AlarmScreen/Components/alarm_helper.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/components/header_tab.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../data.dart';
import 'package:flutter_auth/Screens/AlarmScreen/components/alarm_helper.dart';
import 'package:flutter_auth/models/alarm_info.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HeaderTab(
        backgroundcolor: headerBackgroundColor,
        title: 'Alarm',
        press: () {
          showModalBottomSheet(
            useRootNavigator: true,
            context: context,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setModalState) {
                  return Container(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        FlatButton(
                          onPressed: () async {
                            var selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (selectedTime != null) {
                              final now = DateTime.now();
                              var selectedDateTime = DateTime(
                                  now.year,
                                  now.month,
                                  now.day,
                                  selectedTime.hour,
                                  selectedTime.minute);
                              // _alarmTime = selectedDateTime;
                              setModalState(() {
                                // _alarmTimeString = DateFormat('HH:mm')
                                //     .format(selectedDateTime);
                              });
                            }
                          },
                          child: Text(
                            "00:00",
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                        ListTile(
                          title: Text('Repeat'),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          title: Text('Sound'),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          title: Text('Title'),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        FloatingActionButton.extended(
                          backgroundColor: darkBackground,
                          onPressed: () {
                            scheduleAlarm();
                            Fluttertoast.showToast(
                                msg:
                                    "Wait for 10 Seconds for Notification Test",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor:
                                    Color.fromARGB(255, 48, 48, 48),
                                textColor: Colors.white,
                                fontSize: 15.0);
                          },
                          icon: Icon(Icons.alarm),
                          label: Text('Test Alarm'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
          // scheduleAlarm();
        },
      ),
      
      backgroundColor: darkBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: alarms.map((alarm) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12, left: 25, right: 25),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),                  
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [kPrimaryLightColor, lightBackground],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.label,
                                color: txtColorDark,
                                size: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Office',
                                style: TextStyle(
                                  color: txtColorDark,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Switch(
                              onChanged: (bool value) {},
                              value: true,
                              activeColor: txtColorDark),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Monday to Friday',
                            style: TextStyle(
                                color: txtColorDark,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '07:00 AM',
                            style: TextStyle(
                                color: txtColorDark,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 35,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

void scheduleAlarm() async {
  var scheduleNotificationDateTime = DateTime.now().add(Duration(seconds: 10));

  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'alarm_notif',
    'alarm_notif',
    'Channel for Alarm notification',
    icon: 'codex_logo',
    sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
    largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
  );

  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      sound: 'a_long_cold_sting.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true);
  var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.schedule(0, 'Office', 'Goodmorning',
      scheduleNotificationDateTime, platformChannelSpecifics);
}
