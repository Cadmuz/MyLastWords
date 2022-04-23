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
        press: () {},
      ),
      backgroundColor: darkBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Alarms',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: txtColorLight,
                fontSize: 30),
          ),
          Expanded(
            child: ListView(
              children: alarms.map((alarm) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
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
